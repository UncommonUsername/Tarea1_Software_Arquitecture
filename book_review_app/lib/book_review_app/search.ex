defmodule BookReviewApp.Search do
  @moduledoc """
  Módulo para manejar la búsqueda y la indexación de datos en Elasticsearch.
  """

  alias Elasticsearch.Index

  @index_name "books"  # Nombre del índice en Elasticsearch

  # Indexa un documento en Elasticsearch
  def index_document(book) do
    %{
      id: book.id,
      title: book.title,
      summary: book.summary,
      reviews: book.reviews
    }
    |> Index.create_document(@index_name)
  end

  # Realiza una búsqueda de texto
  def search(query) do
    Elasticsearch.search(@index_name, %{
      query: %{
        multi_match: %{
          query: query,
          fields: ["title", "summary", "reviews"]
        }
      }
    })
  end
end

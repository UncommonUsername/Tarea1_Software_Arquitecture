defmodule BookReviewApp.BookController do
  use BookReviewAppWeb, :controller

  alias BookReviewApp.Search

  def search(conn, %{"q" => query}) do
    results =
      case Search.search(query) do
        {:ok, response} -> response["hits"]["hits"]
        {:error, _reason} -> []  # Si Elasticsearch falla, devuelve un array vacío
      end

    render(conn, "search_results.html", results: results)
  end
end

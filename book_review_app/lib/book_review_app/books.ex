defmodule BookReviewApp.Books do
  import Ecto.Query, warn: false
  alias BookReviewApp.Repo
  alias BookReviewApp.Books.{Author, Book, Review}
  alias BookReviewApp.Cache

  def list_books do
    case Cache.fetch("all_books") do
      # Si no hay datos en caché, hacer la consulta a la base de datos y guardar los resultados
      {:ok, nil} ->
        books = Repo.all(Book)
        Cache.put("all_books", books)
        books

      # Si hay datos en la caché, devolverlos directamente
      {:ok, books} ->
        books
    end
  end

  def list_authors_with_stats(params \\ %{}) do
    sort_by = Map.get(params, "sort", "author")

    query = from a in Author,
      join: b in Book, on: b.author_id == a.id,
      left_join: r in Review, on: r.book_id == b.id,
      group_by: a.id,
      select: %{
        author: a.name,
        books_count: count(b.id),
        avg_score: avg(r.score),
        total_sales: sum(b.sales)
      },
      order_by: [{^sort_by, :asc}]

    Repo.all(query)
  end
end
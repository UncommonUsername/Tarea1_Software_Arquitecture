defmodule BookReviewAppWeb.AuthorController do
  use BookReviewAppWeb, :controller

  alias BookReviewApp.Library
  alias BookReviewApp.Library.Author
  alias BookReviewApp.Book

  def index(conn, params) do
    valid_order_bys = ["asc", "asc_nulls_last", "asc_nulls_first", "desc", "desc_nulls_last", "desc_nulls_first"]
    valid_sort_bys = ["name", "books_count", "avg_score", "total_sales"]

    order_by = if params["order_by"] in valid_order_bys do
      case params["order_by"] do
        "asc" -> :asc
        "asc_nulls_last" -> :asc_nulls_last
        "asc_nulls_first" -> :asc_nulls_first
        "desc" -> :desc
        "desc_nulls_last" -> :desc_nulls_last
        "desc_nulls_first" -> :desc_nulls_first
      end
    else
      :asc  # Default value
    end

    sort_by = if params["sort_by"] in valid_sort_bys do
      params["sort_by"]
    else
      "name"  # Default value
    end

    authors_stats = Library.list_authors_with_stats(%{"sort_by" => sort_by, "order_by" => order_by})
    render(conn, "index.html", authors_stats: authors_stats)
  end

  def new(conn, _params) do
    changeset = Library.change_author(%Author{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"author" => author_params}) do
    case Library.create_author(author_params) do
      {:ok, author} ->
        conn
        |> put_flash(:info, "Author created successfully.")
        |> redirect(to: ~p"/authors/#{author}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    author = Library.get_author!(id)
    render(conn, :show, author: author)
  end

  def edit(conn, %{"id" => id}) do
    author = Library.get_author!(id)
    changeset = Library.change_author(author)
    render(conn, :edit, author: author, changeset: changeset)
  end

  def update(conn, %{"id" => id, "author" => author_params}) do
    author = Library.get_author!(id)

    case Library.update_author(author, author_params) do
      {:ok, author} ->
        conn
        |> put_flash(:info, "Author updated successfully.")
        |> redirect(to: ~p"/authors/#{author}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, author: author, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    author = Library.get_author!(id)
    {:ok, _author} = Library.delete_author(author)

    conn
    |> put_flash(:info, "Author deleted successfully.")
    |> redirect(to: ~p"/authors")
  end
end

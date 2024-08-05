defmodule BookReviewApp.LibraryFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `BookReviewApp.Library` context.
  """

  @doc """
  Generate a author.
  """
  def author_fixture(attrs \\ %{}) do
    {:ok, author} =
      attrs
      |> Enum.into(%{
        bio: "some bio",
        country: "some country",
        dob: ~D[2024-08-04],
        name: "some name"
      })
      |> BookReviewApp.Library.create_author()

    author
  end

  @doc """
  Generate a book.
  """
  def book_fixture(attrs \\ %{}) do
    {:ok, book} =
      attrs
      |> Enum.into(%{
        published_at: ~D[2024-08-04],
        sales: 42,
        summary: "some summary",
        title: "some title"
      })
      |> BookReviewApp.Library.create_book()

    book
  end

  @doc """
  Generate a review.
  """
  def review_fixture(attrs \\ %{}) do
    {:ok, review} =
      attrs
      |> Enum.into(%{
        review: "some review",
        score: 42,
        upvotes: 42
      })
      |> BookReviewApp.Library.create_review()

    review
  end

  @doc """
  Generate a sale.
  """
  def sale_fixture(attrs \\ %{}) do
    {:ok, sale} =
      attrs
      |> Enum.into(%{
        sales: 42,
        year: 42
      })
      |> BookReviewApp.Library.create_sale()

    sale
  end
end

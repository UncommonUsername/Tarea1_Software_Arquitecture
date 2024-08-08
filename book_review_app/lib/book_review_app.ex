defmodule BookReviewApp do
  @moduledoc """
  BookReviewApp keeps the contexts that define your domain
  and business logic.
  """

  alias BookReviewApp.Library

  # Other context aliases...

  defdelegate list_authors_with_stats(params), to: Books
end
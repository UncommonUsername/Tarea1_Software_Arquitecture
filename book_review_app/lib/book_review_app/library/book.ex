defmodule BookReviewApp.Library.Book do
  use Ecto.Schema
  import Ecto.Changeset

  schema "books" do
    field :published_at, :date
    field :sales, :integer
    field :summary, :string
    field :title, :string
    field :author_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(book, attrs) do
    book
    |> cast(attrs, [:title, :summary, :published_at, :sales])
    |> validate_required([:title, :summary, :published_at, :sales])
  end
end

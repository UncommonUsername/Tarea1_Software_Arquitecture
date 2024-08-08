defmodule BookReviewApp.Book do
  use Ecto.Schema
  import Ecto.Changeset

  schema "books" do
    field :published_at, :date
    field :summary, :string
    field :title, :string
    # field :genre, :string  # Añadir el campo :genre

    belongs_to :author, BookReviewApp.Author
    has_many :reviews, BookReviewApp.Review
    has_many :sales, BookReviewApp.Sale

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(book, attrs) do
    book
    |> cast(attrs, [:title, :summary, :published_at, :sales, :author_id, :genre])
    |> validate_required([:title, :summary, :published_at, :sales, :author_id, :genre])
    |> foreign_key_constraint(:author_id)
  end
end

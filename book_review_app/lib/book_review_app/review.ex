defmodule BookReviewApp.Review do
  use Ecto.Schema
  import Ecto.Changeset

  schema "reviews" do
    field :review, :string
    field :score, :integer
    field :upvotes, :integer
    
    belongs_to :book, BookReviewApp.Book

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(review, attrs) do
    review
    |> cast(attrs, [:review, :score, :upvotes, :book_id])
    |> validate_required([:review, :score, :upvotes, :book_id])
    |> foreign_key_constraint(:book_id)
  end
end
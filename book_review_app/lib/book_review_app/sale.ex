defmodule BookReviewApp.Sale do
  use Ecto.Schema
  import Ecto.Changeset

  schema "sales" do
    field :sales, :integer
    field :year, :integer
    
    belongs_to :book, BookReviewApp.Book

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(sale, attrs) do
    sale
    |> cast(attrs, [:year, :sales, :book_id])
    |> validate_required([:year, :sales, :book_id])
    |> foreign_key_constraint(:book_id)
  end
end
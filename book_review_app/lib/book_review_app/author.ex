defmodule BookReviewApp.Author do
  use Ecto.Schema
  import Ecto.Changeset

  schema "authors" do
    field :bio, :string
    field :country, :string
    field :dob, :date
    field :name, :string
    
    has_many :books, BookReviewApp.Book

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(author, attrs) do
    author
    |> cast(attrs, [:name, :dob, :country, :bio])
    |> validate_required([:name, :dob, :country, :bio])
  end
end
defmodule BookReviewApp.Sale do
  use Ecto.Schema
  import Ecto.Changeset

  schema "sales" do
    field :sales, :integer
    field :year, :integer
    field :book_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(sale, attrs) do
    sale
    |> cast(attrs, [:year, :sales])
    |> validate_required([:year, :sales])
  end
end

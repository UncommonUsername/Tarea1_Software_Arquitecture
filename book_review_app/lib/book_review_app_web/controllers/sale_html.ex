defmodule BookReviewAppWeb.SaleHTML do
  use BookReviewAppWeb, :html

  embed_templates "sale_html/*"

  @doc """
  Renders a sale form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def sale_form(assigns)
end

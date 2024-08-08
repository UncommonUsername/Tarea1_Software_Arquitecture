defmodule BookReviewAppWeb.AuthorHTML do
  use BookReviewAppWeb, :html

  embed_templates "author_html/*"

  @doc """
  Renders a author form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def author_form(assigns)

  @doc """
  Renders the list of authors with stats.
  """
  def render("index.html", assigns) do
    ~L"""
    <h1>Authors</h1>
    <table>
      <thead>
        <tr>
          <th>Name</th>
          <th>Books Count</th>
          <th>Average Score</th>
          <th>Total Sales</th>
        </tr>
      </thead>
      <tbody>
        <%= for author_stat <- @authors_stats do %>
          <tr>
            <td><%= author_stat.author %></td>
            <td><%= author_stat.books_count %></td>
            <td><%= author_stat.avg_score %></td>
            <td><%= author_stat.total_sales %></td>
          </tr>
        <% end %>
      </tbody>
    </table>
    """
  end
end
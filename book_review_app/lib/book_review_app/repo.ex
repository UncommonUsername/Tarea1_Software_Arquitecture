defmodule BookReviewApp.Repo do
  use Ecto.Repo,
    otp_app: :book_review_app,
    adapter: Ecto.Adapters.Postgres
end

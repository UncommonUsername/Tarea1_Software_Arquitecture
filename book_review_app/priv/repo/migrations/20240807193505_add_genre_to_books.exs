defmodule BookReviewApp.Repo.Migrations.AddGenreToBooks do
  use Ecto.Migration

  def change do
    alter table(:books) do
      add :genre, :string
    end
  end
end

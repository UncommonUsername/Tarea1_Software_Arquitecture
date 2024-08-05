defmodule BookReviewApp.Repo.Migrations.CreateBooks do
  use Ecto.Migration

  def change do
    create table(:books) do
      add :title, :string
      add :summary, :text
      add :published_at, :date
      add :sales, :integer
      add :author_id, references(:authors, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:books, [:author_id])
  end
end

defmodule BookReviewApp.Repo.Migrations.AddForeignKeys do
  use Ecto.Migration

  def change do
    # No realizar ningún cambio en la tabla books ya que la columna author_id ya existe
    # alter table(:books) do
    # end

    # No realizar ningún cambio en la tabla reviews ya que la columna book_id ya existe
    # alter table(:reviews) do
    # end

    # No realizar ningún cambio en la tabla sales ya que la columna book_id ya existe
    # alter table(:sales) do
    # end

    # Crear índices solo si no existen
    if_not_exists(:books, [:author_id])
    if_not_exists(:reviews, [:book_id])
    if_not_exists(:sales, [:book_id])
  end

  defp if_not_exists(table, columns) do
    index_name = "#{table}_#{Enum.join(columns, "_")}_index"
    execute("""
    DO $$
    BEGIN
      IF NOT EXISTS (
        SELECT 1
        FROM pg_class c
        JOIN pg_namespace n ON n.oid = c.relnamespace
        WHERE c.relname = '#{index_name}'
          AND n.nspname = 'public'
      ) THEN
        CREATE INDEX #{index_name} ON #{table} (#{Enum.join(columns, ", ")});
      END IF;
    END$$;
    """)
  end
end

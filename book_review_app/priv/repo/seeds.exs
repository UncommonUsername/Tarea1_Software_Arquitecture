# En la parte superior del archivo
Mix.Task.run("app.start")

alias BookReviewApp.Repo
alias BookReviewApp.Author
alias BookReviewApp.Book
alias BookReviewApp.Review
alias BookReviewApp.Sale
import Ecto.Query

# Función auxiliar para generar fechas aleatorias
defmodule DateHelper do
  def random_date(from, to) do
    from_days = Date.to_erl(from) |> :calendar.date_to_gregorian_days
    to_days = Date.to_erl(to) |> :calendar.date_to_gregorian_days
    random_days = from_days + :rand.uniform(to_days - from_days)
    random_days |> :calendar.gregorian_days_to_date |> Date.from_erl!
  end
end

# Limpiar la base de datos existente
Repo.delete_all(Sale)
Repo.delete_all(Review)
Repo.delete_all(Book)
Repo.delete_all(Author)

# Crear autores
authors = for _ <- 1..50 do
  author = Repo.insert!(%Author{
    name: Faker.Name.name(),
    dob: DateHelper.random_date(~D[1920-01-01], ~D[2000-01-01]),
    country: Faker.Address.country(),
    bio: Faker.Lorem.paragraphs(3..6) |> Enum.join("\n")
  })
  IO.puts "Created author: #{author.name}"
  author
end

# Lista de géneros literarios
genres = ["Fiction", "Non-fiction", "Mystery", "Science Fiction", "Fantasy", "Romance", "Thriller", "Horror", "Biography", "History", "Self-help"]

# Crear libros
books = for _ <- 1..300 do
  author = Enum.random(authors)
  published_at = DateHelper.random_date(Date.add(author.dob, 365 * 18), Date.utc_today())

  book = Repo.insert!(%Book{
    title: Faker.Lorem.sentence(),
    summary: Faker.Lorem.paragraphs(3..8) |> Enum.join("\n"),
    published_at: published_at,
    author_id: author.id
  })
  IO.puts "Created book: #{book.title}"
  book
end

# Crear reseñas
for book <- books do
  for _ <- 1..Enum.random(0..20) do
    Repo.insert!(%Review{
      book_id: book.id,
      review: Faker.Lorem.paragraphs(2..5) |> Enum.join("\n"),
      score: Enum.random(1..5),
      upvotes: Enum.random(0..1000)
    })
  end
end

# Crear ventas
current_year = Date.utc_today().year

for book <- books do
  publication_year = book.published_at.year
  years_since_publication = current_year - publication_year + 1

  for year <- publication_year..current_year do
    yearly_sales = Enum.random(1..10000)  # Genera ventas aleatorias

    Repo.insert!(%Sale{
      book_id: book.id,
      year: year,
      sales: yearly_sales
    })
  end
end

IO.puts "Seed data has been successfully inserted!"

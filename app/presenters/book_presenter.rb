class BookPresenter
  def initialize(book)
    @book = book
  end

  def as_json(*)
    {
      id: @book.id,
      title: @book.title,
      author: @book.author,
      published_at: @book.published_at
    }
  end
end

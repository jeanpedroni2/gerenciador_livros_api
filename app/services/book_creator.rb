require "ostruct"

class BookCreator
  def initialize(form)
    @form = form
  end

  def call
    return OpenStruct.new(success?: false, book: nil, errors: @form.errors.full_messages) unless @form.valid?

    book = ::Book.create(@form.attributes)  # <--- o :: força buscar Book no namespace global
    if book.persisted?
      ActiveSupport::Notifications.instrument("book.created", book: book)
      OpenStruct.new(success?: true, book: book, errors: [])
    else
      OpenStruct.new(success?: false, book: nil, errors: book.errors.full_messages)
    end
  end
end

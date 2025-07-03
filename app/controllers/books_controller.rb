class BooksController < ApplicationController
  before_action :authenticate_user!
  respond_to :json

  def create
    form = BookForm.new(book_params)
    result = BookCreator.new(form).call

    if result.success?
      render json: BookPresenter.new(result.book).as_json, status: :created
    else
      render json: { errors: result.errors }, status: :unprocessable_entity
    end
  end

  def index
    books = Book.all
    render json: books.map { |book| BookPresenter.new(book).as_json }
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :published_at)
  end
end

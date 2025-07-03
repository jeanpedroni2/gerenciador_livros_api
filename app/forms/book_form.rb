class BookForm
  include ActiveModel::Model
  attr_accessor :title, :author, :published_at

  validates :title, presence: true
  validates :author, presence: true

  def attributes
    {
      title: title,
      author: author,
      published_at: published_at
    }
  end
end

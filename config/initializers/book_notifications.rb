ActiveSupport::Notifications.subscribe("book.created") do |name, start, finish, id, payload|
  book = payload[:book]
  Rails.logger.info "Livro criado: #{book.title} por #{book.author} (ID: #{book.id})"
end

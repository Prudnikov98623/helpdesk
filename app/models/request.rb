class Request < ApplicationRecord
  enum status: { newly_created: 'Новая', in_progress: 'В работе', client_review: 'Клиент проверяет', closed: 'Закрыта' }
  enum request_type: { emergency: 'Экстренная', maintenance: 'Плановое обслуживание' }

  validates :title, presence: true
  validates :description, presence: true
end

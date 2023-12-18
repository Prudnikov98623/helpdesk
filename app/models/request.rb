class Request < ApplicationRecord
  enum status: { newly_created: 'Новая', in_progress: 'В работе', client_review: 'Клиент проверяет', closed: 'Закрыта' }
  enum request_type: { emergency: 'Экстренная', maintenance: 'Плановое обслуживание' }


  belongs_to :responsible_user, class_name: 'User', foreign_key: 'responsible_user_id', optional: true

  validates :title, presence: true
  validates :description, presence: true
end

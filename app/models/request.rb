class Request < ApplicationRecord
  enum status: { newly_created: 'Новая', in_progress: 'В работе', client_review: 'Клиент проверяет', closed: 'Закрыта' }
  enum request_type: { emergency: 'Экстренная', maintenance: 'Плановое обслуживание' }


  belongs_to :responsible_user, class_name: 'User', foreign_key: 'responsible_user_id', optional: true

  belongs_to :target_user, class_name: 'User', optional: true

  def transferable_users
    case user.role.role_name
    when 'Менеджер'
      User.all
    when 'Первая линия'
      User.where(role: Role.find_by(role_name: 'Вторая линия'))
    when 'Вторая линия'
      User.where(role: Role.find_by(role_name: 'Третья линия'))
    else
      User.none
    end
  end

  validates :title, presence: true
  validates :description, presence: true
end

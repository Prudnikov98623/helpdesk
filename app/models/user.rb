class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  enum role: [:user, :admin, :engineer, :manager, :first_line, :second_line, :third_line]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

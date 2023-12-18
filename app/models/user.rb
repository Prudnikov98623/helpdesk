class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  belongs_to :role
  accepts_nested_attributes_for :role


  has_many :requests, foreign_key: 'responsible_user_id', dependent: :destroy

  has_many :transfer_requests, dependent: :destroy
  has_many :transferred_requests, through: :transfer_requests, source: :request

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable



end

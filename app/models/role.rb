class Role < ApplicationRecord
  has_many :users

  def humanize
    role_name.humanize
  end
end

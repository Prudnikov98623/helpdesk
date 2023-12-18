class AddTargetUserToRequests < ActiveRecord::Migration[7.1]
  def change
    add_reference :requests, :target_user, foreign_key: { to_table: :users }, null: true
  end
end

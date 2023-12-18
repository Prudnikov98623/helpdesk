class CreateRequests < ActiveRecord::Migration[7.1]
  def change
    create_table :requests do |t|
      t.string :title
      t.text :description
      t.string :status
      t.string :request_type
      t.references :responsible_user, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end

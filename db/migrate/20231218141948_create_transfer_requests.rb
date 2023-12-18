class CreateTransferRequests < ActiveRecord::Migration[7.1]
  def change
    create_table :transfer_requests do |t|
      t.references :user, null: false, foreign_key: true
      t.references :request, null: false, foreign_key: true

      t.timestamps
    end
  end
end

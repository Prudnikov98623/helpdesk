class CreateRequests < ActiveRecord::Migration[7.1]
  def change
    create_table :requests do |t|
      t.string :title
      t.text :description
      t.string :status
      t.string :type

      t.timestamps
    end
  end
end

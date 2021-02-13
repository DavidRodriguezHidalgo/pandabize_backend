class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.float :amount
      t.text :items, null: false, limit: 16777215
      t.timestamps
    end
  end
end

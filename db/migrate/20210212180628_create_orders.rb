class CreateOrders < ActiveRecord::Migration[7.2]
  def change
    create_table :orders do |t|
      t.float :amount
      t.text :items, null: false
      
      t.timestamps
    end
  end
end

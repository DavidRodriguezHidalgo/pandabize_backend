class CreateLimitValues < ActiveRecord::Migration[7.2]
  def change
    create_table :limit_values do |t|
      t.references :limit
      t.references :feature

      t.timestamps
    end
  end
end

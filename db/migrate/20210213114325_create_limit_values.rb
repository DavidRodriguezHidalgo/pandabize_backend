class CreateLimitValues < ActiveRecord::Migration[6.0]
  def change
    create_table :limit_values do |t|
      t.references :limit
      t.references :feature
      t.timestamps
    end
  end
end

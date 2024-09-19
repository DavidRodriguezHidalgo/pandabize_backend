class CreateLimits < ActiveRecord::Migration[7.2]
  def change
    create_table :limits do |t|
      t.references :feature_value
      
      t.timestamps
    end
  end
end

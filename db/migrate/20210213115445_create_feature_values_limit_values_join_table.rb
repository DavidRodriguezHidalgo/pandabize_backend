class CreateFeatureValuesLimitValuesJoinTable < ActiveRecord::Migration[7.2]
  def change
    create_join_table :feature_values, :limit_values
  end
end

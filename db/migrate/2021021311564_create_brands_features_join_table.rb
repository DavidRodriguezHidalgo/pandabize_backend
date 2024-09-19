class CreateBrandsFeaturesJoinTable < ActiveRecord::Migration[7.2]
  def change
    create_join_table :brands, :features
  end
end

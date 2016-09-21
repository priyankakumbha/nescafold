class AddLatlngToShops < ActiveRecord::Migration
  def change
    add_column :shops, :latlng, :string
  end
end

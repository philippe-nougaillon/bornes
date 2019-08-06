class AddIndexToBornes < ActiveRecord::Migration[5.2]
  def change
    add_index :bornes, :id_station
  end
end

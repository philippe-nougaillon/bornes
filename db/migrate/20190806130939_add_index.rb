class AddIndex < ActiveRecord::Migration[5.2]
  def change
    add_index :bornes, :ad_station
  end
end

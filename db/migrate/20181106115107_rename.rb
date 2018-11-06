class Rename < ActiveRecord::Migration[5.2]
  def change
  	rename_column :bornes, :Xlongitude, :longitude
  	rename_column :bornes, :Ylatitude, :latitude
  end
end

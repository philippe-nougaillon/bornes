class AddIndexToBorne < ActiveRecord::Migration[5.2]
  def change
    add_index :bornes, [:latitude, :longitude]
  end
end

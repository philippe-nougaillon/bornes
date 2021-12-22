class AddTypesPrisesToBorne < ActiveRecord::Migration[5.2]
  def change
    add_column :bornes, :type_prise_t2, :boolean, null: false, default: false
    add_column :bornes, :type_prise_ccs, :boolean, null: false, default: false
    add_column :bornes, :type_prise_chademo, :boolean, null: false, default: false
    add_column :bornes, :type_prise_autre, :boolean, null: false, default: false
  end
end

class AddGratuitToBorne < ActiveRecord::Migration[5.2]
  def change
    add_column :bornes, :gratuit, :boolean, null: false, default: false
    add_column :bornes, :paiement_cb, :boolean, null: false, default: false
    add_column :bornes, :paiement_acte, :boolean, null: false, default: false
    add_column :bornes, :paiement_autre, :boolean, null: false, default: false
    add_column :bornes, :tarification, :string
  end
end

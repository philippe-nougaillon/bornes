class CreateBornes < ActiveRecord::Migration[5.2]
  def change
    create_table :bornes do |t|
      t.string :n_amenageur
      t.string :n_operateur
      t.string :n_enseigne
      t.string :id_station
      t.string :n_station
      t.string :ad_station
      t.string :code_insee
      t.float :Xlongitude
      t.float :Ylatitude
      t.integer :nbre_pdc
      t.string :id_pdc
      t.string :puiss_max
      t.string :type_prise
      t.string :acces_recharge
      t.string :accessibilité
      t.string :observations
      t.string :date_maj
      t.string :source

      t.timestamps
    end
  end
end

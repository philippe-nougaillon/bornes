class Borne < ApplicationRecord
	reverse_geocoded_by :latitude, :longitude

  self.per_page = 10

end

# Source bornes : https://www.data.gouv.fr/fr/datasets/fichier-consolide-des-bornes-de-recharge-pour-vehicules-electriques/
# Pour lancer l'import: 
# Copier le ficher en racine, sous le nom de bornes-irve.csv
# $ rails console
# > Borne.last
# > import = ImportBorneCSV.new(path: 'bornes-irve.csv')
# > import.run!
# > import.report.status

# sur heroku/ pour supprimer les données existantes 
# ActiveRecord::Base.connection.execute("DELETE FROM bornes;")

class ImportBorneCSV
  include CSVImporter

  model Borne

  # Header fichier CSV au 2021-12
  ## nom_amenageur,
  ## nom_operateur,
  ## nom_enseigne,
  ## id_station_itinerance,
  ## nom_station,
  ## adresse_station,
  ## code_insee_commune,
  ## coordonneesXY,
  ## puissance_nominale,
  ## accessibilite_pmr,
  ## prise_type_ef,
  ## prise_type_2,
  ## prise_type_combo_ccs,
  ## prise_type_chademo,
  ## prise_type_autre,

  ## gratuit,
  ## paiement_acte,
  ## paiement_cb,
  ## paiement_autre,
  ## tarification,

  # siren_amenageur,
  # contact_amenageur,
  # contact_operateur,
  # telephone_operateur,
  # id_station_local,
  # implantation_station,
  # nbre_pdc,
  # id_pdc_itinerance,
  # id_pdc_local,

  # column :d_pdc	
  # column :acces_recharge	

  # condition_acces,
  # reservation,
  # horaires,
  # restriction_gabarit,
  # station_deux_roues,
  # raccordement,
  # num_pdl,
  # date_mise_en_service,
  # observations,
  # date_maj,
  # last_modified,
  # datagouv_dataset_id,
  # datagouv_resource_id,
  # datagouv_organization_or_owner

  column :n_amenageur, as: 'nom_amenageur'
  column :n_operateur, as: 'nom_operateur'
  column :n_enseigne, as: 'nom_enseigne'	
  column :id_station, as: 'id_station_itinerance'
  column :n_station, as: 'nom_station'
  column :ad_station, as: 'adresse_station'
  column :code_insee, as: 'code_insee_commune'
  column :nbre_pdc
  column :puiss_max, as: 'puissance_nominale'
  column :accessibilité, as: 'accessibilite_pmr'	
  column :observations
  column :date_maj	
  column :extra, as: 'coordonneesXY', to: ->(value, borne, column) do
    s = value.gsub('[', '').gsub(']','').split(',') 
    borne[:latitude] = s.first
    borne[:longitude] = s.last
  end 

  column :type_prise, as: 'prise_type_2', to: ->(value, borne, column) do
    borne[:type_prise_t2] = value
  end

  column :type_prise, as: 'prise_type_combo_ccs', to: ->(value, borne, column) do
    borne[:type_prise_ccs] = value 
  end

  column :gratuit
  column :paiement_acte
  column :paiement_cb
  column :paiement_autre
  column :tarification

  identifier :id_station
  when_invalid :skip

end

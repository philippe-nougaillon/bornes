class Borne < ApplicationRecord
	reverse_geocoded_by :latitude, :longitude

  self.per_page = 10
end

class ImportBorneCSV
  include CSVImporter

  model Borne

  column :n_amenageur
  column :n_operateur
  column :n_enseigne	
  column :id_station
  column :n_station	
  column :ad_station
  column :code_insee
  column :longitude, as: 'Xlongitude' 
  column :latitude, as: 'Ylatitude'	
  column :nbre_pdc
  column :d_pdc	
  column :puiss_max
  column :type_prise
  column :acces_recharge	
  column :accessibilité	
  column :observations
  column :date_maj	

  # Source bornes : https://www.data.gouv.fr/fr/datasets/fichier-consolide-des-bornes-de-recharge-pour-vehicules-electriques/

  # Pour lancer l'import: 

  # Copier le ficher en racine, sous le nom de bornes-irve.csv
  # $ rails console
  # > Borne.last
  # > import = ImportBorneCSV.new(path: 'bornes-irve.csv')
  # > import.run!
  # > import.report.status

end

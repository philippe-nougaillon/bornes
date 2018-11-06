class Borne < ApplicationRecord
	reverse_geocoded_by :latitude, :longitude

  self.per_page = 15
end

# Source : https://www.data.gouv.fr/fr/datasets/fichier-consolide-des-bornes-de-recharge-pour-vehicules-electriques/
# import = Borne::ImportBorneCSV.new(path: '/home/philnoug/Téléchargements/bornes-irve-20181022.csv')
# import.run!
# import.report.status

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
  column :source

  identifier :id_station

end

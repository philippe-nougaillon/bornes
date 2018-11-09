json.extract! borne, :id, :n_amenageur, :n_operateur, :n_enseigne, :id_station,
						:distance, 
						:n_station, :ad_station, :code_insee, :longitude, :latitude, 
					 	:nbre_pdc, :id_pdc, :puiss_max, :type_prise, :acces_recharge, 
					 	:accessibilité, :observations, :date_maj, :source, :created_at, :updated_at

json.url borne_url(borne, format: :json)

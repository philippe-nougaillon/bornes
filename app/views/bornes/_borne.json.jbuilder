json.extract! borne, :id, :n_amenageur, :n_operateur, :n_enseigne, :n_station, :ad_station,
					 	:puiss_max, :type_prise, :acces_recharge, :accessibilité, :observations, :date_maj

json.set! :distance, borne.distance.to_i

#json.url borne_url(borne, format: :json)

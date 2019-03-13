json.extract! borne, :id, :n_amenageur, :n_operateur, :n_enseigne, :n_station, :ad_station,
					 	:puiss_max, :type_prise, :acces_recharge, :accessibilité, :observations, :date_maj

json.set! :distance, borne.try(:distance)

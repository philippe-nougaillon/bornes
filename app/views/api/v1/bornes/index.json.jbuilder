json.array!(@bornes) do |borne|
  json.extract! borne, :id, :ad_station,:puiss_max, :type_prise, :acces_recharge
  json.set! :distance, borne.try(:distance)
end

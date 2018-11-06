require 'test_helper'

class BornesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @borne = bornes(:one)
  end

  test "should get index" do
    get bornes_url
    assert_response :success
  end

  test "should get new" do
    get new_borne_url
    assert_response :success
  end

  test "should create borne" do
    assert_difference('Borne.count') do
      post bornes_url, params: { borne: { Xlongitude: @borne.Xlongitude, Ylatitude: @borne.Ylatitude, acces_recharge: @borne.acces_recharge, accessibilité: @borne.accessibilité, ad_station: @borne.ad_station, code_insee: @borne.code_insee, date_maj: @borne.date_maj, id_pdc: @borne.id_pdc, id_station: @borne.id_station, n_amenageur: @borne.n_amenageur, n_enseigne: @borne.n_enseigne, n_operateur: @borne.n_operateur, n_station: @borne.n_station, nbre_pdc: @borne.nbre_pdc, observations: @borne.observations, puiss_max: @borne.puiss_max, source: @borne.source, type_prise: @borne.type_prise } }
    end

    assert_redirected_to borne_url(Borne.last)
  end

  test "should show borne" do
    get borne_url(@borne)
    assert_response :success
  end

  test "should get edit" do
    get edit_borne_url(@borne)
    assert_response :success
  end

  test "should update borne" do
    patch borne_url(@borne), params: { borne: { Xlongitude: @borne.Xlongitude, Ylatitude: @borne.Ylatitude, acces_recharge: @borne.acces_recharge, accessibilité: @borne.accessibilité, ad_station: @borne.ad_station, code_insee: @borne.code_insee, date_maj: @borne.date_maj, id_pdc: @borne.id_pdc, id_station: @borne.id_station, n_amenageur: @borne.n_amenageur, n_enseigne: @borne.n_enseigne, n_operateur: @borne.n_operateur, n_station: @borne.n_station, nbre_pdc: @borne.nbre_pdc, observations: @borne.observations, puiss_max: @borne.puiss_max, source: @borne.source, type_prise: @borne.type_prise } }
    assert_redirected_to borne_url(@borne)
  end

  test "should destroy borne" do
    assert_difference('Borne.count', -1) do
      delete borne_url(@borne)
    end

    assert_redirected_to bornes_url
  end
end

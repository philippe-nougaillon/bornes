require "application_system_test_case"

class BornesTest < ApplicationSystemTestCase
  setup do
    @borne = bornes(:one)
  end

  test "visiting the index" do
    visit bornes_url
    assert_selector "h1", text: "Bornes"
  end

  test "creating a Borne" do
    visit bornes_url
    click_on "New Borne"

    fill_in "Xlongitude", with: @borne.Xlongitude
    fill_in "Ylatitude", with: @borne.Ylatitude
    fill_in "Acces Recharge", with: @borne.acces_recharge
    fill_in "Accessibilité", with: @borne.accessibilité
    fill_in "Ad Station", with: @borne.ad_station
    fill_in "Code Insee", with: @borne.code_insee
    fill_in "Date Maj", with: @borne.date_maj
    fill_in "Id Pdc", with: @borne.id_pdc
    fill_in "Id Station", with: @borne.id_station
    fill_in "N Amenageur", with: @borne.n_amenageur
    fill_in "N Enseigne", with: @borne.n_enseigne
    fill_in "N Operateur", with: @borne.n_operateur
    fill_in "N Station", with: @borne.n_station
    fill_in "Nbre Pdc", with: @borne.nbre_pdc
    fill_in "Observations", with: @borne.observations
    fill_in "Puiss Max", with: @borne.puiss_max
    fill_in "Source", with: @borne.source
    fill_in "Type Prise", with: @borne.type_prise
    click_on "Create Borne"

    assert_text "Borne was successfully created"
    click_on "Back"
  end

  test "updating a Borne" do
    visit bornes_url
    click_on "Edit", match: :first

    fill_in "Xlongitude", with: @borne.Xlongitude
    fill_in "Ylatitude", with: @borne.Ylatitude
    fill_in "Acces Recharge", with: @borne.acces_recharge
    fill_in "Accessibilité", with: @borne.accessibilité
    fill_in "Ad Station", with: @borne.ad_station
    fill_in "Code Insee", with: @borne.code_insee
    fill_in "Date Maj", with: @borne.date_maj
    fill_in "Id Pdc", with: @borne.id_pdc
    fill_in "Id Station", with: @borne.id_station
    fill_in "N Amenageur", with: @borne.n_amenageur
    fill_in "N Enseigne", with: @borne.n_enseigne
    fill_in "N Operateur", with: @borne.n_operateur
    fill_in "N Station", with: @borne.n_station
    fill_in "Nbre Pdc", with: @borne.nbre_pdc
    fill_in "Observations", with: @borne.observations
    fill_in "Puiss Max", with: @borne.puiss_max
    fill_in "Source", with: @borne.source
    fill_in "Type Prise", with: @borne.type_prise
    click_on "Update Borne"

    assert_text "Borne was successfully updated"
    click_on "Back"
  end

  test "destroying a Borne" do
    visit bornes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Borne was successfully destroyed"
  end
end

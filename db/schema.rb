# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_08_11_125830) do

  create_table "bornes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "n_amenageur"
    t.string "n_operateur"
    t.string "n_enseigne"
    t.string "id_station"
    t.string "n_station"
    t.string "ad_station"
    t.string "code_insee"
    t.float "longitude"
    t.float "latitude"
    t.integer "nbre_pdc"
    t.string "id_pdc"
    t.string "puiss_max"
    t.string "type_prise"
    t.string "acces_recharge"
    t.string "accessibilité"
    t.string "observations"
    t.string "date_maj"
    t.string "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ad_station"], name: "index_bornes_on_ad_station"
    t.index ["id_station"], name: "index_bornes_on_id_station"
    t.index ["latitude", "longitude"], name: "index_bornes_on_latitude_and_longitude"
  end

end

# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160715192112) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "apartamentos", force: :cascade do |t|
    t.string   "numr_apartamento"
    t.string   "numr_bloco"
    t.integer  "condominio_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "apartamentos", ["condominio_id"], name: "index_apartamentos_on_condominio_id", using: :btree

  create_table "bairros", force: :cascade do |t|
    t.string   "nome_bairro"
    t.integer  "cidade_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "bairros", ["cidade_id"], name: "index_bairros_on_cidade_id", using: :btree

  create_table "cidades", force: :cascade do |t|
    t.string   "nome_cidade"
    t.boolean  "flag_ativo"
    t.integer  "estado_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "cidades", ["estado_id"], name: "index_cidades_on_estado_id", using: :btree

  create_table "condominios", force: :cascade do |t|
    t.string   "nome_condominio"
    t.datetime "data_cancelamento"
    t.string   "email"
    t.integer  "endereco_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "condominios", ["endereco_id"], name: "index_condominios_on_endereco_id", using: :btree

  create_table "enderecos", force: :cascade do |t|
    t.string   "desc_endereco"
    t.string   "desc_cep"
    t.integer  "bairro_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "enderecos", ["bairro_id"], name: "index_enderecos_on_bairro_id", using: :btree

  create_table "estados", force: :cascade do |t|
    t.string   "nome_estado"
    t.string   "sigl_estado"
    t.boolean  "flag_ativo"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "funcaos", force: :cascade do |t|
    t.string   "desc_funcao"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "tiporeservacondominios", force: :cascade do |t|
    t.integer  "tiporeserva_id"
    t.integer  "condominio_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "tiporeservacondominios", ["condominio_id"], name: "index_tiporeservacondominios_on_condominio_id", using: :btree
  add_index "tiporeservacondominios", ["tiporeserva_id"], name: "index_tiporeservacondominios_on_tiporeserva_id", using: :btree

  create_table "tiporeservas", force: :cascade do |t|
    t.string   "desc_tiporeserva"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "apartamentos", "condominios"
  add_foreign_key "bairros", "cidades"
  add_foreign_key "cidades", "estados"
  add_foreign_key "condominios", "enderecos"
  add_foreign_key "enderecos", "bairros"
  add_foreign_key "tiporeservacondominios", "condominios"
  add_foreign_key "tiporeservacondominios", "tiporeservas"
end

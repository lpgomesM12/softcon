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

ActiveRecord::Schema.define(version: 20160722163602) do

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
    t.integer  "cidade_id"
  end

  add_index "enderecos", ["bairro_id"], name: "index_enderecos_on_bairro_id", using: :btree
  add_index "enderecos", ["cidade_id"], name: "index_enderecos_on_cidade_id", using: :btree

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

  create_table "grupopermissaos", force: :cascade do |t|
    t.string   "nome"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "grupopermissao_id"
    t.integer  "condominio_id"
  end

  add_index "grupopermissaos", ["condominio_id"], name: "index_grupopermissaos_on_condominio_id", using: :btree
  add_index "grupopermissaos", ["grupopermissao_id"], name: "index_grupopermissaos_on_grupopermissao_id", using: :btree

  create_table "grupopermissaousers", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "grupopermissao_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "condominio_id"
  end

  add_index "grupopermissaousers", ["condominio_id"], name: "index_grupopermissaousers_on_condominio_id", using: :btree
  add_index "grupopermissaousers", ["grupopermissao_id"], name: "index_grupopermissaousers_on_grupopermissao_id", using: :btree
  add_index "grupopermissaousers", ["user_id"], name: "index_grupopermissaousers_on_user_id", using: :btree

  create_table "moradors", force: :cascade do |t|
    t.integer  "apartamento_id"
    t.integer  "pessoa_id"
    t.integer  "user_inclusao"
    t.integer  "integer"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "moradors", ["apartamento_id"], name: "index_moradors_on_apartamento_id", using: :btree
  add_index "moradors", ["integer"], name: "index_moradors_on_integer", using: :btree
  add_index "moradors", ["pessoa_id"], name: "index_moradors_on_pessoa_id", using: :btree
  add_index "moradors", ["user_inclusao"], name: "index_moradors_on_user_inclusao", using: :btree

  create_table "pessoas", force: :cascade do |t|
    t.string   "nome_pessoa"
    t.string   "desc_fone"
    t.string   "cpf"
    t.string   "rg"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "reservas", force: :cascade do |t|
    t.datetime "data_reserva"
    t.string   "hora_inicio"
    t.string   "hora_fim"
    t.integer  "tiporeserva_id"
    t.datetime "data_cancelamento"
    t.integer  "apartamento_id"
    t.decimal  "valr_reserva"
    t.boolean  "flag_autorizado"
    t.string   "nome_solicitante"
    t.string   "email_solicitante"
    t.integer  "condominio_id"
    t.datetime "data_autorizacao"
    t.integer  "user_inclusao"
    t.integer  "integer"
    t.integer  "user_cancelamento"
    t.integer  "user_autorizacao"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "desc_motivocancelamento"
  end

  add_index "reservas", ["apartamento_id"], name: "index_reservas_on_apartamento_id", using: :btree
  add_index "reservas", ["condominio_id"], name: "index_reservas_on_condominio_id", using: :btree
  add_index "reservas", ["integer"], name: "index_reservas_on_integer", using: :btree
  add_index "reservas", ["tiporeserva_id"], name: "index_reservas_on_tiporeserva_id", using: :btree
  add_index "reservas", ["user_autorizacao"], name: "index_reservas_on_user_autorizacao", using: :btree
  add_index "reservas", ["user_cancelamento"], name: "index_reservas_on_user_cancelamento", using: :btree
  add_index "reservas", ["user_inclusao"], name: "index_reservas_on_user_inclusao", using: :btree

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

  create_table "usercondominios", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "funcao_id"
    t.integer  "condominio_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "usercondominios", ["condominio_id"], name: "index_usercondominios_on_condominio_id", using: :btree
  add_index "usercondominios", ["funcao_id"], name: "index_usercondominios_on_funcao_id", using: :btree
  add_index "usercondominios", ["user_id"], name: "index_usercondominios_on_user_id", using: :btree

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
    t.integer  "condominio_id"
    t.integer  "pessoa_id"
  end

  add_index "users", ["condominio_id"], name: "index_users_on_condominio_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["pessoa_id"], name: "index_users_on_pessoa_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "apartamentos", "condominios"
  add_foreign_key "bairros", "cidades"
  add_foreign_key "cidades", "estados"
  add_foreign_key "condominios", "enderecos"
  add_foreign_key "enderecos", "bairros"
  add_foreign_key "enderecos", "cidades"
  add_foreign_key "grupopermissaos", "condominios"
  add_foreign_key "grupopermissaos", "grupopermissaos"
  add_foreign_key "grupopermissaousers", "condominios"
  add_foreign_key "grupopermissaousers", "grupopermissaos"
  add_foreign_key "grupopermissaousers", "users"
  add_foreign_key "moradors", "apartamentos"
  add_foreign_key "moradors", "pessoas"
  add_foreign_key "reservas", "apartamentos"
  add_foreign_key "reservas", "condominios"
  add_foreign_key "reservas", "tiporeservas"
  add_foreign_key "tiporeservacondominios", "condominios"
  add_foreign_key "tiporeservacondominios", "tiporeservas"
  add_foreign_key "usercondominios", "condominios"
  add_foreign_key "usercondominios", "funcaos"
  add_foreign_key "usercondominios", "users"
  add_foreign_key "users", "condominios"
  add_foreign_key "users", "pessoas"
end

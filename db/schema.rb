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

ActiveRecord::Schema.define(version: 20161128165805) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: :cascade do |t|
    t.string   "nome"
    t.string   "telefone1"
    t.string   "telefone2"
    t.string   "desc_uf"
    t.string   "nome_cidade"
    t.string   "desc_endereco"
    t.string   "nome_bairro"
    t.string   "desc_pontoreferencia"
    t.string   "numr_endereco"
    t.string   "desc_cep"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "situacao"
    t.string   "observacao"
    t.string   "cpf"
    t.string   "rg"
  end

  create_table "fotoordemservices", force: :cascade do |t|
    t.integer  "serviceordem_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "foto_file_name"
    t.string   "foto_content_type"
    t.integer  "foto_file_size"
    t.datetime "foto_updated_at"
  end

  add_index "fotoordemservices", ["serviceordem_id"], name: "index_fotoordemservices_on_serviceordem_id", using: :btree

  create_table "productordems", force: :cascade do |t|
    t.integer  "serviceordem_id"
    t.integer  "product_id"
    t.decimal  "valor_product"
    t.integer  "qtd_product"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "productordems", ["product_id"], name: "index_productordems_on_product_id", using: :btree
  add_index "productordems", ["serviceordem_id"], name: "index_productordems_on_serviceordem_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "nome_produto"
    t.string   "descricao"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "serviceordems", force: :cascade do |t|
    t.text     "desc_produto"
    t.string   "nome_tecnicoatendimento"
    t.datetime "data_venda"
    t.datetime "data_instalacao"
    t.string   "desc_formapagamento"
    t.string   "tele_parente1"
    t.string   "tele_parente2"
    t.integer  "client_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "situacao"
    t.string   "situacaocliente"
    t.string   "turno"
    t.string   "horainicio"
    t.string   "horafim"
    t.integer  "dias_validadeproposta"
    t.integer  "dias_prazoentrega"
  end

  add_index "serviceordems", ["client_id"], name: "index_serviceordems_on_client_id", using: :btree

  create_table "serviceordemservices", force: :cascade do |t|
    t.integer  "serviceordem_id"
    t.integer  "service_id"
    t.decimal  "valor_service"
    t.integer  "qtd_service"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "serviceordemservices", ["service_id"], name: "index_serviceordemservices_on_service_id", using: :btree
  add_index "serviceordemservices", ["serviceordem_id"], name: "index_serviceordemservices_on_serviceordem_id", using: :btree

  create_table "services", force: :cascade do |t|
    t.string   "nome_servico"
    t.string   "descricao"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "nome",                   default: "", null: false
    t.string   "email",                  default: "", null: false
    t.string   "role",                   default: "", null: false
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

  add_foreign_key "fotoordemservices", "serviceordems"
  add_foreign_key "productordems", "products"
  add_foreign_key "productordems", "serviceordems"
  add_foreign_key "serviceordems", "clients"
  add_foreign_key "serviceordemservices", "serviceordems"
  add_foreign_key "serviceordemservices", "services"
end

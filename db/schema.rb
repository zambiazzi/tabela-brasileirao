# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2024_11_22_122557) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "partidas", force: :cascade do |t|
    t.string "rodada"
    t.string "nome_mandante"
    t.string "escudo_mandante"
    t.integer "placar_mandante"
    t.string "nome_visitante"
    t.string "escudo_visitante"
    t.integer "placar_visitante"
    t.string "data_jogo"
    t.string "data_realizacao"
    t.string "estadio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tabela_classificacaos", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "posicao"
    t.string "nome"
    t.string "escudo"
    t.integer "pontos"
    t.integer "jogos"
    t.string "rails"
    t.string "generate"
    t.string "migration"
    t.integer "vitorias"
    t.integer "empates"
    t.integer "derrotas"
    t.integer "saldo_de_gols"
    t.json "ultimos_jogos"
  end
end

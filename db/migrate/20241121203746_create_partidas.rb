class CreatePartidas < ActiveRecord::Migration[7.2]
  def change
    create_table :partidas do |t|
      t.string :rodada
      t.string :nome_mandante
      t.string :escudo_mandante
      t.integer :placar_mandante
      t.string :nome_visitante
      t.string :escudo_visitante
      t.integer :placar_visitante
      t.string :data_jogo
      t.string :data_realizacao
      t.string :estadio

      t.timestamps
    end
  end
end

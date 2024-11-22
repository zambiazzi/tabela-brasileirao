class CreateTabelaClassificacao < ActiveRecord::Migration[7.2]
  def change
    create_table :tabela_classificacaos do |t|
      t.integer :posicao
      t.string :escudo
      t.string :nome
      t.integer :pontos
      t.integer :jogos
      t.integer :vitorias
      t.integer :empates
      t.integer :derrotas
      t.integer :saldo_de_gols
      t.string :ultimos_jogos, array: true, default: []

      t.timestamps
    end
  end
end
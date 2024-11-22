class AddColumnsToTabelaClassificacaos < ActiveRecord::Migration[7.2]
  def change
    add_column :tabela_classificacaos, :posicao, :integer
    add_column :tabela_classificacaos, :nome, :string
    add_column :tabela_classificacaos, :escudo, :string
    add_column :tabela_classificacaos, :pontos, :integer
    add_column :tabela_classificacaos, :jogos, :integer
    add_column :tabela_classificacaos, :rails, :string
    add_column :tabela_classificacaos, :generate, :string
    add_column :tabela_classificacaos, :migration, :string
    add_column :tabela_classificacaos, :vitorias, :integer
    add_column :tabela_classificacaos, :empates, :integer
    add_column :tabela_classificacaos, :derrotas, :integer
    add_column :tabela_classificacaos, :saldo_de_gols, :integer
    add_column :tabela_classificacaos, :ultimos_jogos, :json
  end
end

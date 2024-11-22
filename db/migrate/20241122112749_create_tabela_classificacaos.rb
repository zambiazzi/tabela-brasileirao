class CreateTabelaClassificacaos < ActiveRecord::Migration[7.2]
  def change
    create_table :tabela_classificacaos do |t|
      t.timestamps
    end
  end
end

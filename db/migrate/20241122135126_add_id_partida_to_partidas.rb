class AddIdPartidaToPartidas < ActiveRecord::Migration[7.2]
  def change
    add_column :partidas, :id_partida, :integer
  end
end

class AddHoraJogoToPartidas < ActiveRecord::Migration[7.2]
  def change
    add_column :partidas, :hora_jogo, :string
  end
end

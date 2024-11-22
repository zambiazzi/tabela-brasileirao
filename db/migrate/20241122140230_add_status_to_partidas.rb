class AddStatusToPartidas < ActiveRecord::Migration[7.2]
  def change
    add_column :partidas, :status, :string
  end
end

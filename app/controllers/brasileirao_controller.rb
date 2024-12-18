class BrasileiraoController < ApplicationController
  before_action :set_theme
  
  def index
    @teams = BrasileiraoTableService.new.go
  end

  def matches
    BrasileiraoMatchesService.new.go(17339, 17379)

    @match_data_scheduled = Partida.where(id_partida: 17339..17379, status: 'agendado')
    @match_data_ended = Partida.where(id_partida: 17339..17379, status: 'finalizado')
  end

  private

  def set_theme
    @theme = session[:theme] || 'light'
  end
end

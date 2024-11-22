class BrasileiraoController < ApplicationController

  def index
    BrasileiraoTableService.new.go
    @teams = TabelaClassificacao.order(:posicao)
  end

  def matches
    BrasileiraoMatchesService.new.go(17359, 17379)
    @match_data_scheduled = Partida.where(id_partida: 17359..17379, status: 'agendado').order(:data_jogo)
    @match_data_ended = Partida.where(id_partida: 17359..17379, status: 'finalizado').order(:data_jogo)
  end
end

class BrasileiraoController < ApplicationController

  def index
    @teams = TabelaClassificacao.order(:posicao)
  end

  def matches
    @match_data_scheduled = Partida.where(id_partida: 17339..17379, status: 'agendado')
    @match_data_ended = Partida.where(id_partida: 17339..17379, status: 'finalizado')
  end
end

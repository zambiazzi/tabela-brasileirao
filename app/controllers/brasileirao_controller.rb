class BrasileiraoController < ApplicationController
  before_action :set_brasileirao_games_service, only: [:matches]

  def index
    BrasileiraoTableService.new.go
    @teams = TabelaClassificacao.order(:posicao)
  end

  def matches
    @match_data = BrasileiraoMatchesService.new.go
  end

  private

  def set_brasileirao_games_service
    @brasileirao_games_service = BrasileiraoMatchesService.new
  end
end

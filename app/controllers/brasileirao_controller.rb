class BrasileiraoController < ApplicationController
  before_action :set_brasileirao_table_service, only: [:index]
  before_action :set_brasileirao_games_service, only: [:jogos]

  def index
    @table_data = @brasileirao_table_service
  end

  def jogos
  end

  private

  def set_brasileirao_table_service
    @brasileirao_table_service = BrasileiraoTableService.new 
  end

  def set_brasileirao_games_service
    @brasileirao_games_service = BrasileiraoGamesService.new
  end
end

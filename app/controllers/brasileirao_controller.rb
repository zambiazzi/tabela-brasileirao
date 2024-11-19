class BrasileiraoController < ApplicationController
  before_action :set_brasileirao_table_service, only: [:index]
  before_action :set_brasileirao_games_service, only: [:matches]

  def index
    @teams = BrasileiraoTableService.new.go
  end

  def matches
    @match_data = BrasileiraoMatchesService.new.go
  end

  private

  def set_brasileirao_table_service
    @brasileirao_table_service = BrasileiraoTableService.new 
  end

  def set_brasileirao_games_service
    @brasileirao_games_service = BrasileiraoMatchesService.new
  end
end

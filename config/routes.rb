Rails.application.routes.draw do
  root "brasileirao#index"
  get "/jogos", action: 'matches', controller: 'brasileirao'
end

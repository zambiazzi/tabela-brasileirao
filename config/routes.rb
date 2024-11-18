Rails.application.routes.draw do
  root "brasileirao#index"
  get "/jogos", action: 'jogos', controller: 'brasileirao'
end

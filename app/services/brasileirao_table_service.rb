class BrasileiraoTableService
  require 'rest-client'
  require 'json'

  TABLE_URL_DATA = 'https://api.api-futebol.com.br/v1/campeonatos/10/tabela'

  @headers = {
    Authorization: "Bearer #{Figaro.env.API_KEY}"
  }

  private 

  def request
    res = RestClient.get(TABLE_URL_DATA, @headers)
    puts table_data.code
    puts JSON.parse(table_data.body)
  end
end


# {"posicao"=>1, "pontos"=>68, 
# "time"=>{"time_id"=>22, "nome_popular"=>"Botafogo", "sigla"=>"BOT", 
# "escudo"=>"https://cdn.api-futebol.com.br/escudos/638d349052558.svg"}, 
# "jogos"=>33, "vitorias"=>20, "empates"=>8, "derrotas"=>5, "gols_pro"=>52, "gols_contra"=>26, "saldo_gols"=>26, 
# "aproveitamento"=>68, "variacao_posicao"=>0, "ultimos_jogos"=>["v", "e", "v", "v", "e"]}
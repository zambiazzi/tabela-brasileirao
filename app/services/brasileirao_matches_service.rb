class BrasileiraoMatchesService
  require 'rest-client'
  require 'json'

  def initialize(options = {})
    @headers = {
      Authorization: "Bearer #{Figaro.env.API_KEY}"
    }
  end

  def go
    puts "Headers: #{@headers.inspect}"

    res = request

    return {
      rodada: res['rodada'],
      status: res['status'],
      nome_mandante: res['time_mandante']['nome_popular'],
      escudo_mandante: res['time_mandante']['escudo'],
      placar_mandante: res['placar_mandante'],
      nome_visitante: res['time_visitante']['nome_popular'],
      escudo_visitante: res['time_visitante']['escudo'],
      placar_visitante: res['placar_visitante'],
      data_jogo: res['data_realizacao'],
      hora_jogo: res['hora_realizacao'],
      estadio: res['estadio']['nome_popular']
    }
  end

  private

  def request
    res = RestClient.get('https://api.api-futebol.com.br/v1/partidas/16795', @headers)
    JSON.parse(res.body)
  end
end



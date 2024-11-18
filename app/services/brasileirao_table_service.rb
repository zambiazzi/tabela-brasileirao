class BrasileiraoTableService
  require 'rest-client'
  require 'json'

  def initialize(options = {})
    @headers = {
      Authorization: "Bearer #{Figaro.env.API_KEY}"
    }
  end

  def go 
    res = request

    teams = []

    res.each do |res|
      teams.push({
          posicao: res['posicao'],
          escudo: res['time']['escudo'],
          nome: res['time']['nome_popular'],
          pontos: res['pontos'],
          jogos: res['jogos'],
          vitorias: res['vitorias'],
          empates: res['empates'],
          derrotas: res['derrotas'],
          saldo_de_gols: res['saldo_gols'],
          ultimos_jogos: res['ultimos_jogos'],
       }) 
    end

    return teams if teams.present?

    raise "Time não encontrado." unless res.present?

  rescue Exception => e
    raise e.message
  end

  private 

  def request
    res = RestClient.get('https://api.api-futebol.com.br/v1/campeonatos/10/tabela', @headers)
    puts res
  end
end
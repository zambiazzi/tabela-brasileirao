class BrasileiraoTableService
  require 'rest-client'
  require 'json'

  TABLE_URL_DATA = 'https://api.api-futebol.com.br/v1/campeonatos/10/tabela'

  @headers = {
    Authorization: "Bearer #{Figaro.env.API_KEY}"
  }

  def self.go 
    res = self.request

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

  def self.request
    res = RestClient.get(TABLE_URL_DATA, @headers)
    JSON.parse(res.body)
  end
end

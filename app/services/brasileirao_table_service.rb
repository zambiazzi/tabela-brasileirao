class BrasileiraoTableService
  require 'rest-client'
  require 'json'

  def initialize(options = {})
    @headers = {
      Authorization: "Bearer #{Figaro.env.API_KEY}"
    }
  end

  def go
    if TabelaClassificacao.exists? && TabelaClassificacao.maximum(:updated_at) >= 1.hour.ago
      return TabelaClassificacao.order(:posicao)
    end

    res = request

    teams = []

    res.each do |team_data|
      team_attributes = {
        posicao: team_data['posicao'],
        escudo: team_data['time']['escudo'],
        nome: team_data['time']['nome_popular'],
        pontos: team_data['pontos'],
        jogos: team_data['jogos'],
        vitorias: team_data['vitorias'],
        empates: team_data['empates'],
        derrotas: team_data['derrotas'],
        saldo_de_gols: team_data['saldo_gols'],
        ultimos_jogos: team_data['ultimos_jogos'].map do |match_result|
                          case match_result
                          when "v" then "last_5_win.svg"
                          when "e" then "last_5_draw.svg"
                          when "d" then "last_5_loss"
                          else ""
                          end
                        end
       }

      team = TabelaClassificacao.find_or_initialize_by(nome: team_attributes[:nome])
      team.update!(team_attributes)
      
      teams << team
    end

    return teams if teams.present?

    raise "Time não encontrado." unless res.present?
  end

  private 

  def request
    res = RestClient.get('https://api.api-futebol.com.br/v1/campeonatos/10/tabela', @headers)
    JSON.parse(res.body)
  end
end

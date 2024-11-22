class BrasileiraoMatchesService
  require 'rest-client'
  require 'json'

  def initialize(options = {})
    @headers = {
      Authorization: "Bearer #{Figaro.env.API_KEY}"
    }
    @base_url = 'https://api.api-futebol.com.br/v1/partidas/'
  end

  def go(start_id, end_id)
    if Partida.exists? && Partida.maximum(:updated_at) > 1.hour.ago
      return Partida.all
    end

    matches = []

    (start_id..end_id).each do |partida_id|
      break if reached_request_limit?(matches.size)

      match_data = fetch_match_data(partida_id)
      next if match_data.nil?

      matches << save_match_data(match_data)
    end

    matches
  end

  private
  

  def fetch_match_data(partida_id)
    url = "#{@base_url}#{partida_id}"
    response = RestClient.get(url, @headers)
    JSON.parse(response.body)
  rescue RestCLient::ExceptionWithResponse => each
    puts "Erro ao buscar a partida #{partida_id}"
    nil
  end

  def save_match_data(match_data)
    partida = Partida.find_or_initialize_by(id_partida: match_data['id_partida'])
    partida.update!(
      id_partida: match_data['partida_id'],
      rodada: match_data['rodada'],
      status: match_data['status'],
      nome_mandante: match_data['time_mandante']['nome_popular'],
      escudo_mandante: match_data['time_mandante']['escudo'],
      placar_mandante: match_data['placar_mandante'],
      nome_visitante: match_data['time_visitante']['nome_popular'],
      escudo_visitante: match_data['time_visitante']['escudo'],
      placar_visitante: match_data['placar_visitante'],
      data_jogo: match_data['data_realizacao'],
      hora_jogo: match_data['hora_realizacao'],
      estadio: match_data['estadio']&.dig('nome')
    )
    
    partida
  end

  def reached_request_limit?(current_requests)
    daily_limit = 100
    current_requests >= daily_limit
  end
end



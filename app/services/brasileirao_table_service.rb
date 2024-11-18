class BrasileiraoTableService
  require 'rest-client'
  require 'json'

  TABLE_URL_DATA = 'https://api.api-futebol.com.br/v1/campeonatos/10/tabela'

  @headers = {
    Authorization: "Bearer #{ENV['API_KEY']}"
  }

  table_data = RestClient.get(TABLE_URL_DATA, @headers)
  puts table_data.code
  puts JSON.parse(table_data.body)

end
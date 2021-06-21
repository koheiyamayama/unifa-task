require 'net/http'

class Oauth
  CLIENT_ID = "71032c5c6853ffe0002b0b908df5cd7da572a3d1f32abea9d30a4c342d75706c"
  CLIENT_SECRET = "e18a65f2ef8ff3c615ba1c500221403d0508901a23321237667e7991515c19ba"
  REDIRECT_URI = "http://localhost:3000/oauth/callback"
  GRANT_TYPE = "authorization_code"
  TOKEN_ENDPOINT = "https://arcane-ravine-29792.herokuapp.com/oauth/token"

  class << self
    def get_token(code)
      uri = URI(TOKEN_ENDPOINT)
      request = Net::HTTP::Post.new(uri)
      request['Content-Type'] = 'application/x-www-form-urlencoded'
      request.set_form_data(
        'code' => code, 
        'client_id' => CLIENT_ID, 
        'client_secret' => CLIENT_SECRET, 
        'redirect_uri' => REDIRECT_URI, 
        'grant_type' => GRANT_TYPE
      )
      http = Net::HTTP.new(uri.hostname, uri.port)
      http.use_ssl = true
      response = http.request(request)
      JSON.parse(response.body)['access_token']
    end
  end
end

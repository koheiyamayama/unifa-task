require 'net/http'

class MyTweetApp
  attr_reader :token

  REQUEST_URL = 'https://arcane-ravine-29792.herokuapp.com/api/tweets'

  def initialize(token)
    @token = token
  end

  def tweet(picture_url, title)
    uri = URI(REQUEST_URL)
    request = Net::HTTP::Post.new(uri)
    request['Content-Type'] = 'application/json'
    request['Authorization'] = "Bearer #{token}"
    request.set_form_data(
      'text' => title,
      'url' => picture_url
    )
    http = Net::HTTP.new(uri.hostname, uri.port)
    http.use_ssl = true
    response = http.request(request)
    response.code === '201'
  end
end

require 'sinatra'
require 'json'

get '/' do
  "Hello world!"
end

# API

post '/api/review' do
  return 401 unless params["phone_number"]
  JSON.parse(request.body.read)
end

get '/recommendation' do
  return 401 unless params["phone_number"]
  shops = [
    {
      name: "Caffe Umbria",
      url:  "http://umbria.com",
    },
    {
      name: "Stumptown",
      url:  "http://stumptown.com",
    },
    {
      name: "Public Domain",
      url:  "http://publicdomain.com",
    }
  ]

  shop = shops.sample
  {
    recommendation: "You should go to #{shop[:name]}",
    url:            shop[:url]
  }.to_json
end
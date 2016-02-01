require 'sinatra'
require 'json'

require_relative 'data.rb'

set :port, ENV['PORT'] || 5000
set :bind, '127.0.0.1'

get '/' do
  show_all
end

get '/random' do
  randomise_venue
end

get '/:venue.*' do |slug, format|
  find_venue_image(slug, format)
end

get '/:venue' do |slug|
  find_venue(slug)
end

private

def show_all
  layout = { "template": "home" }
  data   = { "title":  "Lunch Places", "venues": DATA }

  build_response(layout, data)
end

def find_venue(slug)
  venue = DATA.detect {|h| h[:slug] == slug }
  return not_found unless venue

  layout = { "template": "venue" }
  data   = { "title": "#{venue[:name]} - Lunch Places", "venue": venue }

  build_response(layout, data)
end

def find_venue_image(slug, format)
  return 'Unknown format' unless format == 'jpg'
  return not_found unless File.exists?("./public/#{slug}.jpg")

  content_type 'image/jpg'
  send_file "./public/#{slug}.jpg"
end

def randomise_venue
  venues = DATA.size
  venue  = DATA[rand(venues)]

  redirect "/#{venue[:slug]}"
end

def build_response(layout, data)
  response = {
    "layout": layout,
    "data":   data
  }

  content_type 'application/x-shunter+json', 'charset' => 'utf-8'
  
  response.to_json
end
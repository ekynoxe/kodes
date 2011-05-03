### Dependencies
require 'rubygems'
require 'sinatra'
require 'erb'
require 'yaml'

### Configuration
CODES = YAML.load_file('kodes.yml').sort

### Controllers
get '/' do
  erb :index
end

get '/k/:code' do
  reg = /^\d+$/
  
  if !reg.match(params[:code]) || !CODES.has_key?(params[:code].to_i)
    raise Sinatra::NotFound
    return
  end
  
# Todo - Here should be handlers to take care of each code specifics if required
  @code = params[:code].to_i
  status @code
  
  erb :kode
end

### Error handling
# Todo - This needs to be differentiated so that when the 404 is *really requested* it
# => renders the normal view without the "real 404 message"
not_found do
  @code = 404
  
  erb :kode
end
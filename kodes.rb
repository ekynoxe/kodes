### Dependencies
require 'rubygems'
require 'sinatra'
require 'erb'
require 'yaml'

### Configuration
## => sorting the HTTP status codes after reading them from the yaml file
CODES = YAML.load_file('kodes.yml')

### Controllers
get '/' do
  @codes = CODES.sort_by {|key,value| key}
  erb :index
end

get '/k/:code' do
  reg = /^\d+$/
  if !reg.match(params[:code]) || !CODES.has_key?(params[:code].to_i)
    raise Sinatra::NotFound
    return
  end
  
# Todo - Here should be handlers to take care of each code specifics if required (eg 1xx that doesn't return anything in a browser')
  @code = params[:code].to_i
  status @code
  
  erb :kode
end

### Error handling
not_found do
  @code = 404
  
  erb :kode
end
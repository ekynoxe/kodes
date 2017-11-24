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

get '/c/:code' do
  @code = match_code(params[:code])

  erb :kode
end

get '/k/:code' do
  @code = match_code(params[:code])
  status @code

  erb :kode
end

def match_code(code)
  reg = /^\d+$/
  if !reg.match(params[:code]) || !CODES.has_key?(params[:code].to_i)
    raise Sinatra::NotFound
    return
  end

  return code.to_i
end

### Error handling
not_found do
  @code = 404

  erb :kode
end

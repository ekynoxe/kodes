require 'rubygems'
require 'sinatra'

get '/' do
  "Errors is a simple service that allows you to test that your front-end code handles error codes properly"
end

get '/k/:code' do
  reg = /^\d+$/
  
  if (reg.match(params[:code]))
    puts 'will halt with '+params[:code]
    halt params[:code].to_i, params[:code]
  else
    raise Sinatra::NotFound
  end
end

not_found do
  'This is nowhere to be found. By the way, this is because you entered a wrong url! If you really want to test a 404, go to <a href="/404">404</a>'
end

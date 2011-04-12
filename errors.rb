require 'rubygems'
require 'sinatra'

CODES = %w{ 100 101 102 122 200 201 202 203 204 205 206 207 226 300 301 302 303 304 305 306 307 400 401 402 403 404 405 406 407 408 409 410 411 412 413 414 415 416 417 418 422 423 424 425 426 444 449 450 499 500 501 502 503 504 505 506 507 509 510 }

get '/' do
  "Errors is a simple service that allows you to test that your front-end code handles error codes properly"
end

get '/k/:code' do
  reg = /^\d+$/

  if !reg.match(params[:code]) || !CODES.include?(params[:code])
    raise Sinatra::NotFound
    return
  end
  
  #here should be handlers to take care of each code specifics if required
  halt params[:code].to_i, params[:code]
end

not_found do
  'This is nowhere to be found. By the way, this is because you entered a wrong url! If you really want to test a 404, go to <a href="/404">404</a>'
end

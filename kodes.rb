require 'rubygems'
require 'sinatra'
require 'erb'

CODES = %w{ 100 101 102 122 200 201 202 203 204 205 206 207 226 300 301 302 303 304 305 306 307 400 401 402 403 404 405 406 407 408 409 410 411 412 413 414 415 416 417 418 422 423 424 425 426 444 449 450 499 500 501 502 503 504 505 506 507 509 510 }

get '/' do
  erb :index
end

get '/k/:code' do
  reg = /^\d+$/

  if !reg.match(params[:code]) || !CODES.include?(params[:code])
    raise Sinatra::NotFound
    return
  end
  
# Todo - Here should be handlers to take care of each code specifics if required
  @code = params[:code].to_i
  status @code
  
  erb :kode
end

# Todo - This needs to be differentiated so that when the 404 is *really requested* it
# => renders the normal view without the "real 404 message"
not_found do
  @code = 404
  
  erb :kode
end
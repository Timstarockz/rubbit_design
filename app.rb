#
# rubbit_design
# app.rb
# by Tim :D
#

require 'sinatra'
require 'sinatra/reloader'

require 'metainspector'

page = MetaInspector.new('http://sploid.gizmodo.com/cool-slow-motion-shots-from-movies-tv-shows-and-music-1676923911/+caseychan')

#index 
get '/' do
  puts page.description
  puts page.meta_tags
  
  erb :index
end


#show
get 'a/:id' do
  erb :show
end


#new
get '/post' do
  erb :new
end

#search
post '/search' do
  query = params[:q]
  redirect "/search?q=#{query}"
end

get '/search' do
  @query = params[:q]
  erb :results
end

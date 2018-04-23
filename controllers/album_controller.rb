require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/albums.rb')

get '/albums' do
  @albums = Album.all()
  erb(:"album/index")
end

get '/albums/:id' do
  @albums = Album.find(params['id'].to_i)
  erb(:"albums/show")
end

require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/album.rb')

#index
get '/albums' do
  @albums = Album.all()
  erb(:"albums/index")
end

#new
get '/albums/new' do
  @albums = Album.all()
  @artists = Artist.all()
  erb(:"albums/new")
end


#create
post "/albums/new" do
  album = Album.new(params)
  album.save()
  redirect to "/albums"
end

#show
get '/albums/:id' do
  @albums = Album.find(params['id'].to_i)
  erb(:"albums/show")
end

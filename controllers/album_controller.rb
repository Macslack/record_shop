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
  #check to user input and put error mesesage when not positive
  # integer or album name is empty
  #write good, specific error messages
  #check for duplicates

  album.save()
  redirect to "/albums"
end

#show
get '/albums/:id' do
  @albums = Album.find(params['id'].to_i)
  erb(:"albums/show")
end

#destory
post '/albums/:id/delete' do
  album = Album.find(params[:id])
  album.destroy()
  redirect to "/albums"
end

#edit
get '/albums/:id/edit' do
  @album = Album.find(params[:id])
  erb(:"albums/edit")
end

#update
post '/albums/:id/edit' do
  @album = Album.new(parmas)
  @albums.update
  redirect to "/albums"
end

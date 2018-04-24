require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/artist.rb')
#index
get '/artists' do
  @artists = Artist.all()
  erb(:"artists/index")
end

#new
get '/artists/new' do
  @artist = Artist.all()
  erb(:"artists/new")
end

#show
get '/artists/:id' do
  @artist = Artist.find(params['id'].to_i)
  erb(:"artists/show")
end

#create
post "/artists/new" do
  artist = Artist.new(params)
  #no blank names/ check for duplicates
  #good error messages specific
  artist.save()
  redirect to "/artists"
end

#destroy
post "/artists/:id/delete" do
  artist = Artist.find(params[:id])
  artist.destroy()
  redirect to "/artists"
end

#edit
get "/artists/:id/edit" do
  @artist = Artist.find(params[:id])
  erb(:"artists/edit")
end

#update
post "/artists/:id/edit" do
  @artist = Artist.new(params)
  # binding.pry
  @artist.update
  redirect to "/artists"
end

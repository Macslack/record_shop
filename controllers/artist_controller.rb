require('sinatra')
require('sinatra/contrib/all')
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
  artist.save()
  redirect to "/artists"
end

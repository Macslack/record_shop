require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/album_controller')
require_relative('controllers/artist_controller')
require_relative('controllers/genre_controller')
require_relative('models/artist.rb')
require_relative('models/album.rb')


get '/' do
  @artists = Artist.all
  @albums = Album.all
  erb(:index)
end

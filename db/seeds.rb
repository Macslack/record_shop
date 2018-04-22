require_relative("../models/artist.rb")
require_relative("../models/album.rb")
require("pry-byebug")


Album.delete_all()
Artist.delete_all()

artist1 = Artist.new({
  "name" => "Boards of Canada"
  })

artist1.save()

artist2 = Artist.new({
  "name" => "Grinderman"
  })

artist2.save()

artist3 = Artist.new({
  "name" => "Kyuss"
  })

artist3.save()

album1 = Album.new({
  "name" => "Music has the right to children",
  "quantity" => "10",
  "artist_id" => artist1.id
  })

album1.save()

album2 = Album.new({
  "name" => "Grinderman 2",
  "quantity" => "20",
  "artist_id" => artist2.id
  })

album2.save()

album3 = Album.new({
  "name" => "Welcome to sky valley",
  "quantity" => "30",
  "artist_id" => artist3.id
  })

album3.save()

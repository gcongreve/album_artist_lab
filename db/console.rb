require("pry")
require_relative("../models/artist")
require_relative("../models/album")



david_bowie = Artist.new("name"=>"David Bowie")
david_bowie.save()
prince = Artist.new("name"=>"Prince")
prince.save()
p david_bowie
p prince

album1 = Album.new({"title"=>"The Best of David Bowie", "genre" => "rock", 'artist' => "David Bowie", 'artist_id' => david_bowie.id})
album1.save()
album2 = Album.new({"title"=>"The Best of Prince", "genre" => "alt", 'artist' => "Prince", 'artist_id' => prince.id})
album2.save()
p album1
p album2

# Album.all()
# Artist.all()
# Album.find_by_artist(david_bowie.id)
# p Artist.find_by_album(album2.id)


# album1 = Album.new({"title"=>"The Best of David Bowie", "genre" => "rock", 'artist' => david_bowie.id})
# album1.save()
# album2 = Album.new({"title"=>"best of Prince", "genre" => "alt", 'artist_id' => prince.id})
# album2.save()

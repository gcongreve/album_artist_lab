require("pry")
require_relative("../models/artist")
require_relative("../models/album")

artist1 = Artist.new("name"=>"David Bowie")
artist1.save()
p artist1

album1 = Album.new({"title"=>"The Best of David Bowie", "genre" => "rock", 'artist_id' => artist1.id})
p album1.save

require("pry-byebug")
require_relative("../models/artist")
require_relative("../models/album")



david_bowie = Artist.new("name"=>"David Bowie")
david_bowie.save() #works
prince = Artist.new("name"=>"Prince")
prince.save() #works
# # p david_bowie #works
# # p prince #works

bowie_album1 = Album.new({"title"=>"The Best of David Bowie", "genre" => "rock", 'artist_id' => david_bowie.id})
bowie_album1.save() #works
#
prince_album1 = Album.new({"title"=>"The Best of Prince", "genre" => "alt", 'artist_id' => prince.id})
prince_album1.save() #works
#
bowie_album2 = Album.new({"title"=>"The Even Better of David Bowie", "genre" => "rock", 'artist_id' => david_bowie.id})
bowie_album2.save() #works
# # p album1 #works
# # p album2 #works
puts "All albums:"
p Album.all()

puts "All artists:"
p Artist.all() #works

puts "Albums by Artist ID:"
p Album.find_albums_by_artist_id(david_bowie.id) #works

puts "Albums by an artist(bowie): "
p david_bowie.artists_albums

puts "Update Prince album:"
prince_album1.title = "The worst of Prince"
prince_album1.update
p prince_album1

puts "Album by album ID: "
p Album.find_album_by_id(bowie_album2.id)

puts "Find artist by id(bowie)"
p Artist.find_artist_by_id(15)

#Artist.delete_all()#works
#Album.delete_all()#works

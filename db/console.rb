require("pry-byebug")
require_relative("../models/artist")
require_relative("../models/album")



david_bowie = Artist.new("name"=>"David Bowie")
# david_bowie.save() #works
prince = Artist.new("name"=>"Prince")
# prince.save() #works
# # p david_bowie #works
# # p prince #works

bowie_album1 = Album.new({"title"=>"The Best of David Bowie", "genre" => "rock", 'artist' => "David Bowie", 'artist_id' => david_bowie.id})
# bowie_album1.save() #works
#
prince_album1 = Album.new({"title"=>"The Best of Prince", "genre" => "alt", 'artist' => "Prince", 'artist_id' => prince.id})
# prince_album1.save() #works
#
bowie_album2 = Album.new({"title"=>"The Even Better of David Bowie", "genre" => "rock", 'artist' => "David Bowie", 'artist_id' => david_bowie.id})
# bowie_album2.save() #works
# # p album1 #works
# # p album2 #works


#p Album.all()  #works
#p Artist.all() #works

# p Album.find_albums_by_artist("David Bowie") #works
p Album.find_albums_by_artist_id(david_bowie.id) #works

#p david_bowie.artists_albums


#p Artist.find_artist_by_album('The Best of Prince') #works




#Artist.delete_all()#works
#Album.delete_all()#works

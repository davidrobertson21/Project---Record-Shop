require ('pg')
require_relative( '../models/artist.rb' )
require_relative( '../models/genre.rb' )
require_relative( '../models/album.rb' )
require('pry-byebug')
 
Genre.delete_all
Artist.delete_all
Album.delete_all


artist1 = Artist.new({"name" => "Nas"})
artist2 = Artist.new({"name" => "Dizzee Rascal"})
artist3 = Artist.new({"name" => "Wu-Tang Clan"})
artist4 = Artist.new({"name" => "Photek"})
artist5 = Artist.new({"name" => "Rage Against The Machine"})
artist6 = Artist.new({"name" => "FKA Twigs"})
artist7 = Artist.new({"name" => "PARTYNEXTDOOR"})
artist8 = Artist.new({"name" => "Roman Flugel"})
artist9 = Artist.new({"name" => "Suzy Salmond"})

artist1.save
artist2.save
artist3.save
artist4.save
artist5.save
artist6.save
artist7.save
artist8.save
artist9.save


genre1 = Genre.new({"type" => "Grime"})
genre2 = Genre.new({"type" => "Hip-Hop"})
genre3 = Genre.new({"type" => "Drum & Bass"})
genre4 = Genre.new({"type" => "Rock"})
genre5 = Genre.new({"type" => "Contempary R&B"})
genre6 = Genre.new({"type" => "R&B"})
genre7 = Genre.new({"type" => "Techno"})

genre1.save
genre2.save
genre3.save
genre4.save
genre5.save
genre6.save
genre7.save

album1 = Album.new({"title" => "Illmatic",
                     "artist_id" => artist1.id,
                     "genre_id" => genre2.id,
                     "quantity" => 3,
                     "buy_price" => 10,
                     "album_artwork" => "https://upload.wikimedia.org/wikipedia/en/6/6b/NasIllmatic.jpg"})

album1.save


# victims = ["Ben", "Andrew", "Duncan", "David", "Michael", "Reece", "Rhys", "Euan", "James", "Ranjini", "Caroline", "Eden", "Dominic", "Bill", "Ian"]

# victims.each do |victim| 
#     speed = (1..30).to_a.sample
#     newVictim = Victim.new({
#     'name' => victim,
#     'run_speed' => speed
#     })
#     newVictim.save
# end
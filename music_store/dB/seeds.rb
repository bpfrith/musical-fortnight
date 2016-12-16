require_relative( '../models/album.rb' )
require_relative( '../models/artist.rb' )
require('pry')

Artist.delete_all
Album.delete_all

artist1 = Artist.new( { 'name' => 'Alter Bridge' } )
artist1.save()
artist2 = Artist.new( { 'name' => 'Trivium' } )
artist2.save()
artist3 = Artist.new( { 'name' => 'Metalllica' } )
artist3.save()
artist4 = Artist.new( { 'name' => 'Architects' } )
artist4.save()
artist5 = Artist.new( { 'name' => 'Any Given Day' } )
artist5.save()

album1 = Album.new({
  "title" => "One Day Remains",
  "quantity" => 1,
  "genre" => "Alternative Rock",
  "artist_id" => artist1.id
  })
album1.save()

album2 = Album.new({
  "title" => "Blackbird",
  "quantity" => 3,
  "genre" => "Alternative Rock",
  "artist_id" => artist1.id
  })
album2.save()

album3 = Album.new({
  "title" => "Acendency",
  "quantity" => 2,
  "genre" => "Heavy Metal",
  "artist_id" => artist2.id
  })
album3.save()

album4 = Album.new({
  "title" => "The Black Album",
  "quantity" => 2,
  "genre" => "Metal",
  "artist_id" => artist3.id
  })
album4.save()

album5 = Album.new({
  "title" => "All Our Gods Have Abandond Us",
  "quantity" => 1,
  "genre" => "Metalcore",
  "artist_id" => artist4.id
  })
album5.save()

album6 = Album.new({
  "title" => "Lost Together // Lost Forever",
  "quantity" => 1,
  "genre" => "Metalcore",
  "artist_id" => artist4.id
  })
album6.save()

album7 = Album.new({
  "title" => "Everlasting",
  "quantity" => 1,
  "genre" => "Djent",
  "artist_id" => artist5.id
  })
album7.save()

binding.pry
nil
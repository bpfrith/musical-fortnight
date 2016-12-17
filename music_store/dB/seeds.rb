require_relative( '../models/album.rb' )
require_relative( '../models/artist.rb' )
require_relative( '../models/inventory.rb' )
require('pry')

Artist.delete_all
Album.delete_all
Stock.delete_all

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
  "genre" => "Alternative Rock"
  })
album1.save()

album2 = Album.new({
  "title" => "Blackbird",
  "quantity" => 3,
  "genre" => "Alternative Rock"
  })
album2.save()

album3 = Album.new({
  "title" => "Acendency",
  "quantity" => 2,
  "genre" => "Heavy Metal"
  })
album3.save()

album4 = Album.new({
  "title" => "The Black Album",
  "quantity" => 2,
  "genre" => "Metal"
  })
album4.save()

album5 = Album.new({
  "title" => "All Our Gods Have Abandond Us",
  "quantity" => 1,
  "genre" => "Metalcore"
  })
album5.save()

album6 = Album.new({
  "title" => "Lost Together // Lost Forever",
  "quantity" => 1,
  "genre" => "Metalcore"
  })
album6.save()

album7 = Album.new({
  "title" => "Everlasting",
  "quantity" => 1,
  "genre" => "Djent"
  })
album7.save()

item1 = Stock.new({
  'artist_id' => artist1.id,
  'album_id' => album1.id
})
item1.save()

item2 = Stock.new({
  'artist_id' => artist1.id,
  'album_id' => album2.id
})
item2.save()

item3 = Stock.new({
  'artist_id' => artist2.id,
  'album_id' => album3.id
})
item3.save()

item4 = Stock.new({
  'artist_id' => artist3.id,
  'album_id' => album4.id
})
item4.save()

item5 = Stock.new({
  'artist_id' => artist4.id,
  'album_id' => album5.id
})
item5.save()

item6 = Stock.new({
  'artist_id' => artist4.id,
  'album_id' => album6.id
})
item6.save()

item7 = Stock.new({
  'artist_id' => artist5.id,
  'album_id' => album7.id
})
item7.save()

binding.pry
nil
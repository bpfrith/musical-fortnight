require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative( '../models/inventory.rb' )
require_relative( '../models/artist.rb' )
require_relative( '../models/album.rb' )
require_relative( '../models/taglines.rb' )
require_relative( '../public/images/links.rb' )


get '/inventory' do
  @inventory = Album.all().sort { |album1, album2| album1.artist.name <=> album2.artist.name }
  @corner_pic = Images.corner_pic()
  @colour = Taglines.colour()
  erb ( :"inventory/index" )
end
require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/artist.rb' )

get '/artists' do
  @artists = Artist.all().sort { |artist1, artist2| artist1.name <=> artist2.name }
  erb ( :"artists/index" )
end
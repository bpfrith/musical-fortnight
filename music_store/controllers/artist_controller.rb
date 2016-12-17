require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/artist.rb' )

get '/artist' do
  @artists = Artist.all()
  erb ( :"artist/index" )
end
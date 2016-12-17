equire( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/zombie.rb' )

get '/albums' do
  @albums = Album.all()
  erb ( :"album/index" )
end
require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/album.rb' )

get '/albums' do
  @albums = Album.all.sort { |album1, album2| album1.title <=> album2.title }
  erb ( :"albums/index" )
end
require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/artist.rb' )

get '/artists' do
  @artists = Artist.all().sort { |artist1, artist2| artist1.name <=> artist2.name }
  erb ( :"artists/index" )
end

get '/artists/new' do
  @artists = Artist.all().sort { |artist1, artist2| artist1.name <=> artist2.name }
  erb ( :"artists/new" )
end

post '/artists' do
  artist = Artist.new(params)
  artist.save
  redirect to("/artist")
end

post '/artists/:id/delete' do
  Artist.delete(params[:id])
  redirect to("/artist")
end
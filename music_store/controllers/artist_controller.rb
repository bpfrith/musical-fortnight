require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/artist.rb' )
require_relative( '../public/images/links.rb' )


get '/artists' do
  @artists = Artist.all().sort { |artist1, artist2| artist1.name <=> artist2.name }
  @corner_pic = Images.corner_pic()
  erb ( :"artists/index" )
end

get '/artists/new' do
  @artists = Artist.all().sort { |artist1, artist2| artist1.name <=> artist2.name }
  @corner_pic = Images.corner_pic()
  erb ( :"artists/new" )
end

post '/artists' do
  artist = Artist.new(params)
  artist.save
  redirect to("/artists")
end

post '/artists/:id/delete' do
  Artist.delete(params[:id])
  redirect to("/artists")
end
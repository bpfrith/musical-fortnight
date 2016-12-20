require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/album.rb' )

get '/albums' do
  @albums = Album.all.sort { |album1, album2| album1.title <=> album2.title }
  erb ( :"albums/index" )
end

get '/albums/new' do
  @artists = Artist.all.sort { |artist1, artist2| artist1.name <=> artist2.name }
  erb ( :"albums/new" )
end

get '/albums/order' do
  @albums = Album.all.sort { |album1, album2| album1.title <=> album2.title }
  erb ( :"albums/order" )
end

# get '/albums/sell' do
#   @albums = Album.all.sort { |album1, album2| album1.title <=> album2.title }
#   erb ( :"albums/sell" )
# end

post '/albums' do
  album = Album.new(params)
  album.save
  redirect to("/albums")
end

post '/albums/:id/delete' do
  Album.delete(params[:id])
  redirect to("/albums")
end

post '/albums/order' do
  album = Album.find(params[:id])
  album.quantity += params[:quantity].to_i
  album.update
  redirect to("/albums")
end

post '/albums/:id/sell' do
  # album = Album.new(params[:id])
  # Album.sell(params[:id])
  # redirect to("/albums")
  album = Album.find(params[:id])
  if album.quantity > 0
    album.quantity -= 1
    album.albums_sold += 1
    album.update
    redirect to("/albums")
  else
    redirect to("/albums")
  end
end
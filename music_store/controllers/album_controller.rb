require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/album.rb' )
require_relative( '../public/images/links.rb' )


get '/albums' do
  @albums = Album.all.sort { |album1, album2| album1.title <=> album2.title }
  @corner_pic = Images.corner_pic()
  erb ( :"albums/index" )
end

get '/albums/new' do
  @artists = Artist.all.sort { |artist1, artist2| artist1.name <=> artist2.name }
  @corner_pic = Images.corner_pic()
  erb ( :"albums/new" )
end

get '/albums/order' do
  @albums = Album.all.sort { |album1, album2| album1.title <=> album2.title }
  @corner_pic = Images.corner_pic()
  erb ( :"albums/order" )
end

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
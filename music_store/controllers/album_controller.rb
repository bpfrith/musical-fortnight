require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/album.rb' )

get '/albums' do
  @albums = Album.all.sort { |album1, album2| album1.title <=> album2.title }
  erb ( :"albums/index" )
end

get '/albums/new' do
  @album = Album.all().sort { |album1, album2| album1.title <=> album2.title }
  erb ( :"albums/new" )
end

get '/albums/order' do
  @album = Album.all().sort { |album1, album2| album1.title <=> album2.title }
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

post '/albums/:id/order' do
  album = Album.update(params[:id])
  album.save
  redirect to("/albums")
end
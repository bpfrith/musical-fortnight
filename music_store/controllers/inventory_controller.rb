require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative( '../models/inventory.rb' )
require_relative( '../models/artist.rb' )
require_relative( '../models/album.rb' )

get '/inventory' do
  @inventory = Inventory.all
  erb ( :"inventory/index" )
end

get '/inventory/new' do
  @artists = Artist.all
  @albums = Album.all
  erb(:"inventory/new")
end

post '/inventory' do
  item = Inventory.new(params)
  item.save
  redirect to("/inventory")
end

post '/inventory/:id/delete' do
  Inventory.delete(params[:id])
  redirect to("/inventory")
end
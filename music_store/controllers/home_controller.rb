require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/taglines.rb' )


get '/' do
  @taglines = Taglines.all()
  erb ( :"/index" )
end
require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/taglines.rb' )
require_relative( '../public/images/links.rb' )


get '/' do
  @taglines = Taglines.all()
  @corner_pic = Images.corner_pic()
  @background = Images.backgrounds()
  @colour = Taglines.colour()
  erb ( :"/index" )
end
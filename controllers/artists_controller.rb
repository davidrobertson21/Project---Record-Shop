require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/artist.rb' )


get '/artists' do
  @artists = Artist.all
  erb ( :"artists/index" )
end

get '/artists/new' do
  @artists = Artist.all
  erb(:"artists/new")
end

post '/artists' do
  @artists = Artist.new(params)
  @artists.save
  redirect to("/artists")
end

get '/artists/:id' do
  @artists = Artist.find(params[:id])
  erb(:"artists/show")
end

post '/artists/:id/delete' do
  Artist.delete(params[:id])
  redirect to("/artists")
end

# UPDATE
get '/artists/:id/edit' do
  @artists = Artist.find(params[:id])
  erb(:"/artists/edit")
end

post '/artists/:id/edit' do
  @artists = Artist.new(params)
  @artists.update
  erb(:"artists/update")
end
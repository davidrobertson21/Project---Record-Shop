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
  @artist = Artist.new(params)
  @artist.save
  redirect to("/artists")
end

get '/artists/:id' do
  @artist = Artist.find(params[:id])
  erb(:"artists/show")
end

post '/artists/:id/delete' do
  @artist = Artist.find(params[:id])
  @artist.delete
  redirect to("/artists")
end

# UPDATE
get '/artists/:id/edit' do
  @artist = Artist.find(params[:id])
  erb(:"/artists/edit")
end

post '/artists/:id/edit' do
  @artist = Artist.new(params)
  @artist.update
  redirect to("/artists")
end
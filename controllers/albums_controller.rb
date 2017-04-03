require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/album.rb' )
require_relative( '../models/artist.rb' )
require_relative( '../models/genre.rb' )

get '/albums' do
  @albums = Album.all
  erb ( :"albums/index" )
end

get '/albums/new' do
  @albums = Album.all
  erb(:"albums/new")
end

post '/albums' do
  @album = Album.new(params)
  @album.save
  redirect to("/albums")
end

get '/albums/:id' do
  @album = Album.find(params[:id])
  erb(:"albums/show")
end

post '/albums/:id/delete' do
  Album.delete(params[:id])
  redirect to("/albums")
end

# UPDATE
get '/albums/:id/edit' do
  @album = Album.find(params[:id])
  @genres = Genre.all
  @artists = Artist.all

  erb(:"albums/edit")
end

post '/albums/:id/edit' do
  @album = Album.new(params)
  @album.update
  redirect to("/albums")
end
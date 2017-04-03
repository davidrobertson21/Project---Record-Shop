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
  @albums = Album.new(params)
  @albums.save
  redirect to("/albums")
end

get '/albums/:id' do
  @albums = Album.find(params[:id])
  erb(:show)
end

post '/albums/:id/delete' do
  Album.delete(params[:id])
  redirect to("/albums")
end

# UPDATE
get '/albums/:id/edit' do
  @albums = Album.find(params[:id])
  erb(:edit)
end

post '/albums/:id/edit' do
  @albums = Album.new(params)
  @albums.update
  erb(:update)
end
require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/genre.rb' )


get '/genres' do
  @genres = Genre.all
  erb ( :"genres/index" )
end

get '/genres/new' do
  @genres = Genre.all
  erb(:"genres/new")
end

post '/genres' do
  @genres = Genre.new(params)
  @genres.save
  redirect to("/genres")
end

get '/genres/:id' do
  @genre = Genre.find(params[:id])
  erb(:"genres/show")
end

post '/genres/:id/delete' do
  @genre = Genre.find(params[:id])
  @genre.delete
  redirect to("/genres")
end

# UPDATE
get '/genres/:id/edit' do
  @genre = Genre.find(params[:id])
  erb(:"/genres/edit")
end

post '/genres/:id/edit' do
  @genre = Genre.new(params)
  @genre.update
  redirect to("/genres")
end
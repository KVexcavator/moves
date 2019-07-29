require 'sinatra'# ruby app.rb
require 'movie'# запуск: ruby -I lib app.rb

get ('/movies') do
  @movie = Movie.new
  @movie.title = "Fuzzy"
  erb :index
end
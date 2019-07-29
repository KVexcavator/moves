require 'sinatra'# ruby app.rb
require 'movie'# запуск: ruby -I lib app.rb

get ('/movies') do
  @movies = []
  @movies[0] = Movie.new
  @movies[0].title = "Fuzzy"
  @movies[1] = Movie.new
  @movies[1].title = "Nifry"
  @movies[2] = Movie.new
  @movies[2].title = "Terminator"
  erb :index
end
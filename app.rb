require 'sinatra'# ruby app.rb
require 'movie'# запуск: ruby -I lib app.rb
require 'movie_store'# загружаем класс хранилища

# экземпляр хранилища данных
store = MovieStore.new('movies.yml')

get ('/movies') do
  # считывает из хранилища
  @movies = store.all
  erb :index
end

get ('/movies/new') do
  erb :new
end

post ('/movies/create') do
  @movie=Movie.new
  @movie.title=params['title']
  @movie.director=params['director']
  @movie.year=params['year']
  #сохраняем в YAML
  store.save(@movie)
  redirect '/movies/new'
end

# запрос с : в ссылке должен быть последним в Sinatra
get ('/movies/:id') do
  id = params['id'].to_i
  @movie = store.find(id)
  erb :show
end
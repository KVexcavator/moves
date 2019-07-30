# ruby -I lob yaml_test.yml
require 'movie' # загружает класс Movie
require 'yaml/store' # загружает класс YAML::Store (для сохр. ланных в файл.yml)
# метолы YAML::Store dump, load  загрузка, выгрузка объекта 

# создание хранилища test.yml
store = YAML::Store.new('test.yml')

# первый объект для сохранения
first_movie = Movie.new
first_movie.title = "Spirited Away"
first_movie.director = "Hayao Miyazaki"
first_movie.year = 2001

# второй объект для сохранения
second_movie = Movie.new
second_movie.title = "Inception"
second_movie.director = "Christopher Nolan"
second_movie.year = 2010

# мнтод YAML::Store для синхронизации записи в файл
store.transaction do
  # сохранение объектов
  store["Spirited Away"] = first_movie
  store["Inception"] = second_movie

  # тестовый вывод одного объекта
  p store["Inception"]
end
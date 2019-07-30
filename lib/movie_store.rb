require 'yaml/store'

class MovieStore

  def initialize(file_name)
    # создаёт хранилище
    @store = YAML::Store.new(file_name)
  end

  # сохраняет объект Movie в хранилище
  def save(movie)
    @store.transaction do
      # присваивает id
      unless movie.id
        highest_id = @store.roots.max || 0
        movie.id = highest_id + 1
      end
      # объект сохраняется с id
      @store[movie.id] = movie
    end
  end

  # читает из хранилища
  def all
    @store.transaction do
      # новый массив со значениями ключей
      @store.roots.map { |id| @store[id] }
    end
  end
end
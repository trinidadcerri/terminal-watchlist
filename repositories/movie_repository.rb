require 'json'
require_relative "../models/movie"

class MovieRepository
  def initialize(json_file)
    @json_file = json_file
    @movies = []
    @next_id = 1
    load_json if File.exist?(@json_file)
  end

  def create(movie)
    movie.id = @next_id
    @movies << movie
    @next_id += 1
    save_json
  end

  def all
    @movies
  end

  def find(id)
    @movies.find { |movie| movie.id == id }
  end

  private

  def save_json
    saved_data = @movies.map do |movie|
      {id: movie.id, name: movie.name, description: movie.description, rating: movie.rating, year: movie.year }
    end

    File.open(@json_file, "wb") do |file|
      file.write(JSON.generate(saved_data))
    end
  end

  def load_json
    searialized_movies = File.read(@json_file)
    movies = JSON.parse(searialized_movies, {symbolize_names: true})
    movies.each do |movie|
      movie[:id] = movie[:id].to_i
      movie[:rating] = movie[:rating].to_f
      @movies << Movie.new(movie)
    end
    @next_id = @movies.last.id + 1
  end
end

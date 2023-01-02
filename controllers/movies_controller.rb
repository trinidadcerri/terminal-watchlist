require_relative "../views/movies_view"
require_relative "../models/movie"

class MoviesController
  def initialize(movie_repository)
    @movie_repository = movie_repository
    @movies_view = MoviesView.new
  end

  def add
    # ask user for name of the movie and save in variable called name
    name = @movies_view.ask_user_for("What is the name of the movie?")
    # ask user for the rating of the movie and save in variable called rating
    rating = @movies_view.ask_user_for("How would you rate the movie of 10?").to_f
    # ask user for the year of the movie and save in variable called year
    year = @movies_view.ask_user_for("What is the yeat that the movie was released?")
    # ask user for the description of the movie and save in variable called description
    description = @movies_view.ask_user_for("What is the movie about?")
    # create new instance of movie
    movie = Movie.new({
      name: name,
      rating: rating,
      year: year,
      description: description
      @movie_repository.create(movie)
    })
    # store movie
    @movie_repository.create(movie)
    # calle display movies
    display_movies
  end

  def import
    # Get the name of a film to search the API save to variable called query
    query = @movies_view.ask_user_for("What is the name of the movie?")
    # query the api and capture the response.
    # display the response to the user.
    # Give the user a message about selecting the data.
    # use an until loop to allow the user to select multiple movies.
  end

  def list
    display_movies
  end

  private

  def display_movies
    movies = @movie_repository.all
    @movies_view.display(movies)
  end
end

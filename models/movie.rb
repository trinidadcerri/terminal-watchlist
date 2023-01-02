class Movie
  attr_accessor :id
  attr_reader :name, :rating, :year, :description

  def initialize(attributes = {})
    @id = attributes[:id]
    @name = attributes[:name]
    @rating = attributes[:rating]
    @year = attributes[:year]
    @description = attributes[:description]
  end
end

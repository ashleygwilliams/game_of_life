class Game

  def initialize(board_dimensions=[10,10], initial_config=random)
    @world = World.new(board_dimensions)
    seed(initial_config)
  end

  def seed
  end

  def play
  end

end
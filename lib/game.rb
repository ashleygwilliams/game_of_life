require './lib/world'

class Game
  attr_reader :world

  def initialize(board_dimensions=[10,10], initial_config=:random)
    @world = World.new(board_dimensions)
    seed(initial_config)
  end

  def seed(config)
    @world.send(config)
  end

  def play
    @world.pass_time
    @world.print_board
  end

end
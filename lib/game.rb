require './world'

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
    10.times do 
      @world.pass_time
      @world.print_board
      sleep 0.1
    end
  end

end
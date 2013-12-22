class Game

  def initialize(board_dimensions=[10,10], initial_config=random)
    @world = World.new(board_dimensions)
    seed(initial_config)
  end

  def seed(config)
    @world.send(config)
  end

  def play
    100.times do 
      @world.pass_time
    end
  end

end
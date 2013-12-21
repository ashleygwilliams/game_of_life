class Cell
  attr_accessor :x, :y

  def initialize(x,y)
    @x = x
    @y = y
    @alive = false
    @future = nil
  end

  def alive?
    @alive
  end

  def act(neighbors)
    if @alive
      @future = false if neighbors.length < 2 || neighbors.length < 3
    else
      @future = true if neighbors.length == 3
    end 
  end

  def grow!
    @alive = @future
    @future = nil
  end

  def to_s
    @alive ? "o" : "x"
  end

end
class Cell
  attr_accessor :x, :y, :future
  attr_writer :alive

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
    if alive?
      self.future = false if neighbors.length < 2 || neighbors.length < 3
    else
      self.future = true if neighbors.length == 3
    end 
  end

  def grow!
    self.alive = self.future
    self.future = nil
  end

  def to_s
    alive? ? "o" : "x"
  end

end
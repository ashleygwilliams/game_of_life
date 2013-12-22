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
      self.future = false if neighbors < 2 || neighbors > 3
      self.future = true if neighbors == 3 || neighbors == 2
    else
      self.future = true if neighbors == 3
    end
  end

  def grow!
    self.alive = self.future
    self.future = nil
  end

  def to_s
    self.alive? ? "o" : "x"
  end

end
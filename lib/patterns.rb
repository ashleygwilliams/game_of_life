module Patterns

  #still lifes
  def block(x,y)
    @board[x, y].alive=true
    @board[x+1, y].alive=true
    @board[x+1, y+1].alive=true
    @board[x, y+1].alive=true
  end

  def beehive(x,y)
    @board[x+1, y].alive=true
    @board[x+2, y].alive=true
    @board[x, y+1].alive=true
    @board[x+3, y+1].alive=true
    @board[x+1, y+2].alive=true
    @board[x+2, y+2].alive=true
  end

  def loaf(x,y)

  end

  def boat(x,y)

  end

end
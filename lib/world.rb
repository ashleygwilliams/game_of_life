require 'Matrix'
require './cell'

class World
  attr_accessor :board

  def initialize(dimensions)
    make_grid(dimensions[0], dimensions[1])
  end

  def get_neighbors(cell)
    neighbors = @board.collect do |other_cell|
        other_cell if neighboring?(cell, other_cell)
    end
    neighbors.to_a.flatten.compact
  end

  def pass_time
    @board.each do |cell|
      cell.act(get_neighbors(cell))
    end
    @board.each { |cell| cell.grow! }
  end

  def print
    @board.each do |cell|
      puts cell.to_s
    end
  end

  private

    def make_grid(rows, cols)
      @board = Matrix.build(rows, cols) {|row, col| Cell.new(row, col)}
    end

    def neighboring?(cell, other_cell)
      other_cell.x == cell.x && other_cell.y == cell.y + 1 ||
      other_cell.x == cell.x && other_cell.y == cell.y - 1 ||
      other_cell.y == cell.y && other_cell.x == cell.x + 1 ||
      other_cell.y == cell.y && other_cell.x == cell.x - 1 ||
      other_cell.x == cell.x + 1 && other_cell.y == cell.y + 1 ||
      other_cell.x == cell.x - 1 && other_cell.y == cell.y - 1 ||
      other_cell.x == cell.x - 1 && other_cell.y == cell.y + 1 ||
      other_cell.x == cell.x + 1 && other_cell.y == cell.y - 1
    end
end

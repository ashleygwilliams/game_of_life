require 'Matrix'
require './cell'
require './patterns'

class World
  include Patterns

  attr_accessor :board

  def initialize(dimensions)
    make_grid(dimensions[0], dimensions[1])
  end

  def neighbors_count(cell)
    neighbors = self.board.collect do |other_cell|
        other_cell if neighboring?(cell, other_cell) && other_cell.alive?
    end
    neighbors.to_a.flatten.compact.length
  end

  def pass_time
    self.board.each { |cell| cell.act(neighbors_count(cell)) }
    self.board.each { |cell| cell.grow! }
  end

  def print_board
    puts self.board.to_a.collect { |row| row.collect { |cell| cell.to_s }.join(' ') }
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

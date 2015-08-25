class Board

  attr_accessor :cells, :positions, :winning_scenarios

  def initialize
    @cells = {
        1 => {x_coordinate: 0, y_coordinate: 0, value: 1},
        2 => {x_coordinate: 0, y_coordinate: 1, value: 2},
        3 => {x_coordinate: 0, y_coordinate: 2, value: 3},
        4 => {x_coordinate: 1, y_coordinate: 0, value: 4},
        5 => {x_coordinate: 1, y_coordinate: 1, value: 5},
        6 => {x_coordinate: 1, y_coordinate: 2, value: 6},
        7 => {x_coordinate: 2, y_coordinate: 0, value: 7},
        8 => {x_coordinate: 2, y_coordinate: 1, value: 8},
        9 => {x_coordinate: 2, y_coordinate: 2, value: 9}
    }
  end

  def positions
    positions = [[@cells[1][:value], @cells[2][:value], @cells[3][:value]], 
                  [@cells[4][:value], @cells[5][:value], @cells[6][:value]], 
                  [@cells[7][:value], @cells[8][:value], @cells[9][:value]]]
  end

  def show    
    puts " #{self.positions[0][0]} | #{self.positions[0][1]} | #{self.positions[0][2]}"
    puts "-----------"
    puts " #{self.positions[1][0]} | #{self.positions[1][1]} | #{self.positions[1][2]}"
    puts "-----------"
    puts " #{self.positions[2][0]} | #{self.positions[2][1]} | #{self.positions[2][2]}"
  end

  def available_cells
    self.cells.select {|k, v| v[:value].is_a? Integer}
  end

  def inverted_board
    self.positions.transpose.map{|row| row.reverse}
  end

end

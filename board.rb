class Board

  attr_accessor :positions, :winning_scenarios

  def initialize
    @positions = [[1, 2, 3], 
                  [4, 5, 6], 
                  [7, 8, 9]]
  end
  
  def cells
    cells = {
        1 => {x_coordinate: 0, y_coordinate: 0},
        2 => {x_coordinate: 0, y_coordinate: 1},
        3 => {x_coordinate: 0, y_coordinate: 2},
        4 => {x_coordinate: 1, y_coordinate: 0},
        5 => {x_coordinate: 1, y_coordinate: 1},
        6 => {x_coordinate: 1, y_coordinate: 2},
        7 => {x_coordinate: 2, y_coordinate: 0},
        8 => {x_coordinate: 2, y_coordinate: 1},
        9 => {x_coordinate: 2, y_coordinate: 2}
    }
  end

  def show                 
    puts " #{@positions[0][0]} | #{@positions[0][1]} | #{@positions[0][2]}"
    puts "-----------"
    puts " #{@positions[1][0]} | #{@positions[1][1]} | #{@positions[1][2]}"
    puts "-----------"
    puts " #{@positions[2][0]} | #{@positions[2][1]} | #{@positions[2][2]}"
  end

  def available_spaces
    @positions.collect do |array|
      array.select {|value| value.is_a? Integer} 
    end.flatten
  end

  def inverted_board
    @positions.transpose.map{|row| row.reverse}
  end

end

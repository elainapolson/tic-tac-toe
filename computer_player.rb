class ComputerPlayer

  attr_accessor :name, :symbol

  def initialize
    @name = "Computer"
  end

  def make_computer_move(board)
    puts "...#{self.name} is choosing a spot..."
    sleep 2
    chosen_spot = board.available_spaces.sample
    puts "#{self.name} chooses spot #{chosen_spot}"
    board.positions[squares[chosen_spot][:x_coordinate]][squares[chosen_spot][:y_coordinate]] = "#{self.symbol}"
  end

  def squares
    squares = {
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

end
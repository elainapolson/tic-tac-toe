class ComputerPlayer

  attr_accessor :name, :symbol

  def initialize
    @name = "Computer"
  end

  def make_computer_move(board)
    puts "...#{self.name} is choosing a spot..."
    sleep 2
    input = board.available_spaces.sample
    puts "#{self.name} chooses spot #{input}"
    board.positions[board.cells[input][:x_coordinate]][board.cells[input][:y_coordinate]] = "#{self.symbol}"
  end

end
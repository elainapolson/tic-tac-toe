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
    board.positions[chosen_spot - 1] = self.symbol
    board.show
  end

end
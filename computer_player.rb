class ComputerPlayer

  attr_accessor :name, :symbol

  def initialize
    @name = "Computer"
  end

  def make_computer_move(board)
    puts "...#{self.name} is choosing a spot..."
    sleep 2
    input = board.available_cells.collect {|k, v| v[:value]}.sample
    puts "#{self.name} chooses spot #{input}"
    board.cells[input][:value] = self.symbol
  end

end
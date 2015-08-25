class HumanPlayer

  attr_accessor :name, :symbol

  def make_move(board, input)
    if invalid_input(board, input)
      puts "Invalid input! Enter a valid space." 
      input = gets.chomp.to_i
      make_move(board, input)
    else 
      board.cells[input][:value] = self.symbol
    end
  end 

  def invalid_input(board, input)
    !(input >= 1 && input <= 9) || !(board.available_cells.include?(input))
  end

end
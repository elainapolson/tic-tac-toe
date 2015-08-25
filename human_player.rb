class HumanPlayer

  attr_accessor :name, :symbol

  def make_move(board, input)
    if !(input >= 1 && input <= 9)
      puts "Ummmm, that doesn't look like a number between 1 - 9. Let's try that again." 
      input = gets.chomp.to_i
      make_move(board, input)
    elsif !(board.available_cells.include?(input))
      puts "Do you need glasses?? That spot is taken! Pick another spot." 
      input = gets.chomp.to_i
      make_move(board, input)
    else 
      board.cells[input][:value] = self.symbol
    end
  end 

end
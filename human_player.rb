require 'pry'

class HumanPlayer

  attr_accessor :name, :symbol

  def initialize(symbol)
    @symbol = symbol
  end

  def make_move(game, board, input)
    if !(input >= 1 && input <= 9)
      puts "Ummmm, that doesn't look like a number between 1 - 9. Let's try that again." 
      input = gets.chomp.to_i
      make_move(game, board, input)
    elsif !(board.available_spaces.include?(input))
      puts "Do you need glasses?? That spot is taken! Pick another spot." 
      input = gets.chomp.to_i
      make_move(game, board, input)
    else 
      board.positions[input - 1] = "#{self.symbol}" 
      board.show
    end
  end 

end
class HumanPlayer

  attr_accessor :name, :symbol

  def make_move(board, input)
    if !(input >= 1 && input <= 9)
      puts "Ummmm, that doesn't look like a number between 1 - 9. Let's try that again." 
      input = gets.chomp.to_i
      make_move(board, input)
    elsif !(board.available_spaces.include?(input))
      puts "Do you need glasses?? That spot is taken! Pick another spot." 
      input = gets.chomp.to_i
      make_move(board, input)
    else 
      board.positions[squares[input][:x_coordinate]][squares[input][:y_coordinate]] = "#{self.symbol}"
    end
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
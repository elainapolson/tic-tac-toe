require_relative "board"
require_relative "computer_player"
require_relative "human_player"

class Game

  attr_accessor :winner

  def initialize
    @board = Board.new
    @computer = ComputerPlayer.new("o")
    @human = HumanPlayer.new("x")
    @turn = 0 
    @winner = nil
    @loser = nil
    welcome_message
  end 

  def welcome_message
    puts "Hi there! I'm Elaina. Let's play a tic-tac-toe game I've created! First, let me get your name."
    puts "---------------------------------------------------"
    print "Human Player: "
    @human.name = gets.chomp.capitalize
    puts "Nice to meet you, #{@human.name}! Let's get started! You will be 'x' and the computer will be 'o'. Pick your spot on the board by choosing a number that corresponds to the space you want."
  end 

  def turn
    while !@winner
      if @turn.even?
        puts "It's #{@human.name}'s turn! Which empty spot do you choose?"
        input = gets.chomp.to_i
        @human.make_move(self, @board, input)
        check_for_winner
        @turn += 1
      elsif @turn.odd?
        puts "It's the computer's turn!"
        @computer.make_computer_move(self, @board)
        check_for_winner
        @turn += 1
      end
    end
  end

  def check_for_winner
    if human_wins
      @winner = @human 
      @loser = @computer
      announce_winner(@winner)
    elsif computer_wins 
      @winner = @computer
      @loser = @human
      announce_winner(@winner)
    elsif tied_game 
      @tie = true
      announce_tie
    end
  end 

  def human_wins
    ((@board.positions[0] == "x") && (@board.positions[1] == "x") && (@board.positions[2] == "x")) || ((@board.positions[3] == "x") && (@board.positions[4] == "x") && (@board.positions[5] == "x")) || ((@board.positions[6] == "x") && (@board.positions[7] == "x") && (@board.positions[8] == "x")) || ((@board.positions[0] == "x") && (@board.positions[3] == "x") && (@board.positions[6] == "x")) || ((@board.positions[1] == "x") && (@board.positions[4] == "x") && (@board.positions[7] == "x")) || ((@board.positions[2] == "x") && (@board.positions[5] == "x") && (@board.positions[8] == "x")) || ((@board.positions[0] == "x") && (@board.positions[4] == "x") && (@board.positions[8] == "x")) || ((@board.positions[2] == "x") && (@board.positions[4] == "x") && (@board.positions[6] == "x"))
  end

  def computer_wins
    ((@board.positions[0] == "o") && (@board.positions[1] == "o") && (@board.positions[2] == "o")) || ((@board.positions[3] == "o") && (@board.positions[4] == "o") && (@board.positions[5] == "o")) || ((@board.positions[6] == "o") && (@board.positions[7] == "o") && (@board.positions[8] == "o")) || ((@board.positions[0] == "o") && (@board.positions[3] == "o") && (@board.positions[6] == "o")) || ((@board.positions[1] == "o") && (@board.positions[4] == "o") && (@board.positions[7] == "o")) || ((@board.positions[2] == "o") && (@board.positions[4] == "o") && (@board.positions[6] == "o")) || ((@board.positions[2] == "o") && (@board.positions[5] == "o") && (@board.positions[8] == "o")) || ((@board.positions[0] == "o") && (@board.positions[4] == "o") && (@board.positions[8] == "o"))
  end

  def tied_game
    !(@board.positions.include?(9)) && !(@board.positions.include?(1)) && !(@board.positions.include?(2)) && !(@board.positions.include?(3)) && !(@board.positions.include?(4)) && !(@board.positions.include?(5)) && !(@board.positions.include?(6)) && !(@board.positions.include?(7)) && !(@board.positions.include?(8))
  end

  def game_is_over
    @tie || @winner
  end

  def announce_tie
    puts "Looks like a tie!!! I guess you're both pretty bad at this, huh?"
  end

  def announce_winner(winner)
    puts "*~*~*~*~*~*~*~*~#{@winner.name} wins!!!*~*~*~*~*~*~*~*~".upcase
    puts "Wow, #{@loser.name}. Have you ever even played Tic Tac Toe?"
  end

  def closing_message
    puts "Great game! Thanks for playing! Do you want to play again? (yes/no)"
    answer = gets.chomp.downcase
    if answer == "yes"
      puts "Awesome! Let's do it again!"
      Game.new.play
    else 
      puts "Ok, suit yourself! See ya!"
    end 
  end

  def play 
    @board.show
    turn
  end

end

new_game = Game.new
new_game.play
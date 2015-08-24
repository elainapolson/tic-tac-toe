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
  end 

  def welcome_message
    puts "Hi there! I'm Elaina. Let's play a tic-tac-toe game I've created! First, let me get your name."
    puts "---------------------------------------------------"
    print "Human Player: "
    @human.name = gets.chomp.capitalize
    puts "Nice to meet you, #{@human.name}! Let's get started! You will be 'x' and the computer will be 'o'. Pick your spot on the board by choosing a number that corresponds to the space you want."
  end 

  def play 
    welcome_message
    @board.show
    turn
  end

  def turn
    while !game_over?
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
    if winner?
      identify_winner
      announce_winner(@winner)
    elsif tied_game?
      announce_tie
    end
  end 

  def winner?

    # go through each winning scenario, and check the board values    
    potential_wins = @board.winning_scenarios.collect do |scenario| 
      scenario.collect {|s| @board.positions[s]}
    end  

    # check the winning positions to see if any are filled with just x's or just o's
    winning_combo = potential_wins.select do |array|
      array.all? {|x| x == array[0]}
    end

    true if winning_combo.length > 0

  end

  def identify_winner
    potential_wins = @board.winning_scenarios.collect do |scenario| 
      scenario.collect {|s| @board.positions[s]}
    end  

    # check the winning positions to see if any are filled with just x's or just o's
    winning_combo = potential_wins.select do |array|
      array.all? {|x| x == array[0]}
    end

    if winning_combo.flatten.first == @human.symbol
      @winner = @human
      @loser = @computer
    else
      @winner = @computer 
      @loser = @human
    end
  end

  def tied_game?
    @board.available_spaces.empty?
  end

  def game_over?
    tied_game? || @winner
  end

  def announce_tie
    puts "Looks like a tie!!! I guess you're both pretty bad at this, huh?"
    closing_message
  end

  def announce_winner(winner)
    puts "*~*~*~*~*~*~*~*~#{@winner.name} wins!!!*~*~*~*~*~*~*~*~".upcase
    puts "Wow, #{@loser.name}. Have you ever even played Tic Tac Toe?"
    closing_message
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

end

new_game = Game.new
new_game.play
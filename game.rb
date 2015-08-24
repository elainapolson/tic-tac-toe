require_relative "board"
require_relative "computer_player"
require_relative "human_player"

class Game

  attr_accessor :winner, :tie, :human, :computer

  def initialize
    @board = Board.new
    @computer = ComputerPlayer.new
    @human = HumanPlayer.new
    @turn = 0 
    @tie = false
    @winner = nil
    @loser = nil
  end 

  def welcome_message
    puts "Hi there! Let's play a tic-tac-toe game I've created! First, let me get your name."
    print "Human Player: "
    @human.name = gets.chomp.capitalize
    puts "Nice to meet you, #{@human.name}! Let's get started! #{@human.name}, would you like to be 'X' or 'O'?"
    input = gets.chomp.upcase
    choose_symbols(input)
  end 

  def choose_symbols(input)
    if input != "X" && input != "O"
      puts "#{input} is not a symbol choice. Please choose 'X' or 'O'."
      input = gets.chomp.upcase
      choose_symbols(input)
    else
      @human.symbol = input
      @human.symbol == "X" ? @computer.symbol = "O" : @computer.symbol = "X"
      puts "Great! You're #{@human.symbol} and the computer is #{@computer.symbol}. Let's start. Pick your spot on the board by choosing a number that corresponds to the space you want."
    end
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
        @human.make_move(@board, input)
        check_for_end_of_game
        @turn += 1
      elsif @turn.odd?
        puts "It's the computer's turn!"
        @computer.make_computer_move(@board)
        check_for_end_of_game
        @turn += 1
      end
    end
  end

  def check_for_end_of_game(board)
    check_for_winner(board)
    check_for_tie(board)
    if @winner
      announce_winner(@winner)
    elsif @tie
      announce_tie
    end
  end 

  def check_for_winner(board)
    potential_wins = board.winning_scenarios.collect do |scenario| 
      scenario.collect {|s| board.positions[s]}
    end  
    winning_combo = potential_wins.select do |array|
      array.all? {|x| x == array[0]}
    end

    if winning_combo.flatten.first == @human.symbol
      @winner = @human
      @loser = @computer
    elsif winning_combo.flatten.first == @computer.symbol
      @winner = @computer 
      @loser = @human
    end
  end

  def check_for_tie(board)
    if board.available_spaces.empty? && !@winner
      @tie = true
    end
  end

  def game_over?
    @tie || @winner
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
require_relative "board"
require_relative "computer_player"
require_relative "human_player"

class Game

  attr_accessor :winner, :loser, :tie, :human, :computer

  def initialize
    @board = Board.new
    @computer = ComputerPlayer.new
    @human = HumanPlayer.new
    @turn = 0 
    @tie = false
    @winner = nil
    @loser = nil
  end 

  def play 
    welcome_message
    get_symbol_input
    kick_off_turns
    take_turn
  end

  def welcome_message
    puts "Hi there! Let's play a tic-tac-toe game I've created! First, let me get your name."
    print "Human Player: "
    @human.name = gets.chomp.capitalize
    puts "Nice to meet you, #{@human.name}!"
  end 

  def get_symbol_input
    puts "Let's get started! #{@human.name}, would you like to be 'X' or 'O'?"
    input = gets.chomp.upcase
    assign_symbols(input)
  end

  def assign_symbols(input)
    if input != "X" && input != "O"
      puts "#{input} is not a symbol choice. Please choose 'X' or 'O'."
      input = gets.chomp.upcase
      assign_symbols(input)
    else
      @human.symbol = input
      @human.symbol == "X" ? @computer.symbol = "O" : @computer.symbol = "X"
      puts "Great! You're #{@human.symbol} and the computer is #{@computer.symbol}."
    end
  end

  def kick_off_turns
    puts "#{human.name}, would you like to go first? Enter 'yes' or 'no'."
    input = gets.chomp.downcase
    if input == "yes"
      @turn = 0
      puts "Great. You'll go first. Pick your spot on the board by choosing a number that corresponds to the space you want."
    else
      @turn = 1
      puts "Ok. Computer will go first"
    end
  end

  def take_turn
    while !game_over?
      if @turn.even?
        @board.show
        puts "It's #{@human.name}'s turn! Which empty spot do you choose?"
        input = gets.chomp.to_i
        @human.make_move(@board, input)
        check_for_end_of_game(@board)
        @turn += 1
      else
        @board.show
        puts "It's the computer's turn!"
        @computer.make_computer_move(@board)
        check_for_end_of_game(@board)
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
    if winning_combination(board).flatten.first == @human.symbol
      @winner = @human
      @loser = @computer
    elsif winning_combination(board).flatten.first == @computer.symbol
      @winner = @computer 
      @loser = @human
    end
  end

  def potential_wins(board)
    board.winning_scenarios.collect do |scenario| 
      scenario.collect {|s| board.positions[s]}
    end
  end  

  def winning_combination(board)
    potential_wins(board).select do |array|
      array.all? {|x| x == array[0]}
    end
  end

  def check_for_tie(board)
    if board.available_spaces.empty? && !@winner
      @tie = true
    end
  end

  def game_over?
    !!@tie || !!@winner
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
    puts "Great game! Thanks for playing! Do you want to play again? Enter 'yes' or 'no'."
    answer = gets.chomp.downcase
    if answer == "yes"
      puts "Awesome! Let's do it again!"
      Game.new.play
    else 
      puts "Ok, suit yourself! See ya!"
    end 
  end

end
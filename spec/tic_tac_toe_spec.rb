require "spec_helper"
require 'pry'
describe Game do 

  before(:each) do
    @game = Game.new
    @game.human.symbol = "X"
    @game.computer.symbol = "O"
    @board = Board.new
  end

  context 'when the game is not over' do 
    before do 
      @game.check_for_end_of_game(@board)
    end

    it "knows it isn't over" do

      expect(@game.game_over?).to eq false
    end

    it 'has no winner' do 
        expect(@game.winner).to eq nil
    end
    
    it 'has no loser' do
      expect(@game.loser).to eq nil
    end
    
    it 'is not tied' do 
      expect(@game.tie).to eq false
    end
  end 


  context "when the game is tied" do
    before do 
      @board.positions = [["#{@game.human.symbol}", "#{@game.human.symbol}", "#{@game.computer.symbol}"], ["#{@game.computer.symbol}", "#{@game.computer.symbol}", "#{@game.human.symbol}"], ["#{@game.human.symbol}", "#{@game.computer.symbol}", "#{@game.human.symbol}"]]
      @game.check_for_end_of_game(@board)
    end

    it "knows the game is over" do
      expect(@game.game_over?).to eq true
    end

    it 'has no winner' do 
        expect(@game.winner).to eq nil
    end
    
    it 'has no loser' do
      expect(@game.loser).to eq nil
    end
    
    it 'know the game is tied' do 
      expect(@game.tie).to eq true
    end
  end 

  context "when the computer wins diagonally" do
    before do 
      @board.positions = [["#{@game.human.symbol}", "#{@game.human.symbol}", "#{@game.computer.symbol}"], ["#{@game.computer.symbol}", "#{@game.computer.symbol}", "#{@game.human.symbol}"], ["#{@game.computer.symbol}", "#{@game.computer.symbol}", "#{@game.human.symbol}"]]
      @game.check_for_end_of_game(@board)
    end

    it "knows the game is over" do
      expect(@game.game_over?).to eq true
    end

    it "knows computer is winner" do 
        expect(@game.winner).to eq @game.computer
    end
    
    it "knows human is loser" do
      expect(@game.loser).to eq @game.human
    end
    
    it "know the game is not tied" do 
      expect(@game.tie).to eq false
    end
  end

  context "when the human wins diagonally" do
    before do 
      @board.positions = [["#{@game.computer.symbol}", "#{@game.computer.symbol}", "#{@game.human.symbol}"], ["#{@game.human.symbol}", "#{@game.human.symbol}", "#{@game.computer.symbol}"], ["#{@game.human.symbol}", "#{@game.human.symbol}", "#{@game.computer.symbol}"]]
      @game.check_for_end_of_game(@board)
    end 

    it "knows the game is over" do
      expect(@game.game_over?).to eq true
    end

    it "knows human is winner" do 
        expect(@game.winner).to eq @game.human
    end
    
    it "knows computer is loser" do
      expect(@game.loser).to eq @game.computer
    end
    
    it "know the game is not tied" do 
      expect(@game.tie).to eq false
    end
  end

  context "when the computer wins horizontally" do
    before do
      @board.positions = [["#{@game.computer.symbol}", "#{@game.computer.symbol}", "#{@game.computer.symbol}"], ["#{@game.human.symbol}", "#{@game.human.symbol}", "#{@game.computer.symbol}"], ["#{@game.human.symbol}", "#{@game.computer.symbol}", "#{@game.human.symbol}"]]
      @game.check_for_end_of_game(@board)
    end
    
    it "knows the game is over" do
      expect(@game.game_over?).to eq true
    end

    it "knows computer is winner" do 
        expect(@game.winner).to eq @game.computer
    end
    
    it "knows human is loser" do
      expect(@game.loser).to eq @game.human
    end
    
    it "know the game is not tied" do 
      expect(@game.tie).to eq false
    end
  end

  context "when the human wins horizontally" do
    before do
      @board.positions = [["#{@game.human.symbol}", "#{@game.human.symbol}", "#{@game.human.symbol}"], ["#{@game.computer.symbol}", "#{@game.computer.symbol}", "#{@game.human.symbol}"], ["#{@game.computer.symbol}", "#{@game.human.symbol}", "#{@game.computer.symbol}"]]
      @game.check_for_end_of_game(@board)
    end

    it "knows the game is over" do
      expect(@game.game_over?).to eq true
    end

    it "knows human is winner" do 
        expect(@game.winner).to eq @game.human
    end
    
    it "knows computer is loser" do
      expect(@game.loser).to eq @game.computer
    end
    
    it "know the game is not tied" do 
      expect(@game.tie).to eq false
    end
  end

  context "when the computer wins vertically" do
    before do 
      @board.positions = [["#{@game.computer.symbol}", "#{@game.human.symbol}", "#{@game.human.symbol}"], ["#{@game.computer.symbol}", "#{@game.computer.symbol}", "#{@game.human.symbol}"], ["#{@game.computer.symbol}", "#{@game.human.symbol}", "#{@game.computer.symbol}"]]
      @game.check_for_end_of_game(@board)
    end

    it "knows the game is over" do
      expect(@game.game_over?).to eq true
    end

    it "knows computer is winner" do 
        expect(@game.winner).to eq @game.computer
    end
    
    it "knows human is loser" do
      expect(@game.loser).to eq @game.human
    end
    
    it "know the game is not tied" do 
      expect(@game.tie).to eq false
    end
  end

  context "when human wins vertically" do
    before do 
      @board.positions = [["#{@game.human.symbol}", "#{@game.human.symbol}", "#{@game.computer.symbol}"], ["#{@game.human.symbol}", "#{@game.computer.symbol}", "#{@game.human.symbol}"], ["#{@game.human.symbol}", "#{@game.computer.symbol}", "#{@game.human.symbol}"]]
      @game.check_for_end_of_game(@board)
    end

    it "knows the game is over" do
      expect(@game.game_over?).to eq true
    end

    it "knows human is winner" do 
        expect(@game.winner).to eq @game.human
    end
    
    it "knows computer is loser" do
      expect(@game.loser).to eq @game.computer
    end
    
    it "know the game is not tied" do 
      expect(@game.tie).to eq false
    end
  end

end
require "spec_helper"

require 'pry'

describe Game do 

  before(:each) do
    @game = Game.new
    @game.human.symbol = "X"
    @game.computer.symbol = "O"
    @board = Board.new
  end
  
  it "works for a tie" do
    @board.positions = ["#{@game.human.symbol}", "#{@game.human.symbol}", "#{@game.computer.symbol}", "#{@game.computer.symbol}", "#{@game.computer.symbol}", "#{@game.human.symbol}", "#{@game.human.symbol}", "#{@game.computer.symbol}", "#{@game.human.symbol}"]

    @game.check_for_winner(@board)
    @game.check_for_tie(@board)

    expect(@game.winner).to eq nil
    expect(@game.tie).to eq true
  end

  it "works when computer wins diagonally" do
    @board.positions = ["#{@game.human.symbol}", "#{@game.human.symbol}", "#{@game.computer.symbol}", "#{@game.computer.symbol}", "#{@game.computer.symbol}", "#{@game.human.symbol}", "#{@game.computer.symbol}", "#{@game.computer.symbol}", "#{@game.human.symbol}"]

    @game.check_for_winner(@board)
    @game.check_for_tie(@board)
    expect(@game.winner).to eq @game.computer
    expect(@game.tie).to eq false
  end

  it "works when human wins diagonally" do
    @board.positions = ["#{@game.computer.symbol}", "#{@game.computer.symbol}", "#{@game.human.symbol}", "#{@game.human.symbol}", "#{@game.human.symbol}", "#{@game.computer.symbol}", "#{@game.human.symbol}", "#{@game.human.symbol}", "#{@game.computer.symbol}"]

    @game.check_for_winner(@board)
    @game.check_for_tie(@board)
    expect(@game.winner).to eq @game.human
    expect(@game.tie).to eq false
  end

  it "works when computer wins horizontally" do
    @board.positions = ["#{@game.computer.symbol}", "#{@game.computer.symbol}", "#{@game.computer.symbol}", "#{@game.human.symbol}", "#{@game.human.symbol}", "#{@game.computer.symbol}", "#{@game.human.symbol}", "#{@game.computer.symbol}", "#{@game.human.symbol}"]

    @game.check_for_winner(@board)
    @game.check_for_tie(@board)

    expect(@game.winner).to eq @game.computer
    expect(@game.tie).to eq false
  end

  it "works when human wins horizontally" do
    @board.positions = ["#{@game.human.symbol}", "#{@game.human.symbol}", "#{@game.human.symbol}", "#{@game.computer.symbol}", "#{@game.computer.symbol}", "#{@game.human.symbol}", "#{@game.computer.symbol}", "#{@game.human.symbol}", "#{@game.computer.symbol}"]

    @game.check_for_winner(@board)
    @game.check_for_tie(@board)

    expect(@game.winner).to eq @game.human
    expect(@game.tie).to eq false
  end

  it "works when computer wins vertically" do
    @board.positions = ["#{@game.computer.symbol}", "#{@game.human.symbol}", "#{@game.human.symbol}", "#{@game.computer.symbol}", "#{@game.computer.symbol}", "#{@game.human.symbol}", "#{@game.computer.symbol}", "#{@game.human.symbol}", "#{@game.computer.symbol}"]

    @game.check_for_winner(@board)
    @game.check_for_tie(@board)

    expect(@game.winner).to eq @game.computer
    expect(@game.tie).to eq false
  end

  it "works when human wins vertically" do
    @board.positions = ["#{@game.human.symbol}", "#{@game.human.symbol}", "#{@game.computer.symbol}", "#{@game.human.symbol}", "#{@game.computer.symbol}", "#{@game.human.symbol}", "#{@game.human.symbol}", "#{@game.computer.symbol}", "#{@game.human.symbol}"]

    @game.check_for_winner(@board)
    @game.check_for_tie(@board)

    expect(@game.winner).to eq @game.human
    expect(@game.tie).to eq false
  end
end


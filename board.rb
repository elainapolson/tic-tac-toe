class Board

  attr_accessor :positions, :winning_scenarios

  def initialize
    @positions = [1, 2, 3, 4, 5, 6, 7, 8, 9] 
    @winning_scenarios = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
  end

  def show                 
    puts " #{@positions[0]} | #{@positions[1]} | #{@positions[2]}"
    puts "-----------"
    puts " #{@positions[3]} | #{@positions[4]} | #{@positions[5]}"
    puts "-----------"
    puts " #{@positions[6]} | #{@positions[7]} | #{@positions[8]}"
  end

  def available_spaces
    @positions.select {|p| p.is_a? Integer}
  end

end
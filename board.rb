class Board

  attr_accessor :positions, :winning_scenarios

  def initialize
    @positions = [[1, 2, 3], 
                  [4, 5, 6], 
                  [7, 8, 9]]
  end

  def show                 
    puts " #{@positions[0][0]} | #{@positions[0][1]} | #{@positions[0][2]}"
    puts "-----------"
    puts " #{@positions[1][0]} | #{@positions[1][1]} | #{@positions[1][2]}"
    puts "-----------"
    puts " #{@positions[2][0]} | #{@positions[2][1]} | #{@positions[2][2]}"
  end

  def available_spaces
    @positions.collect do |array|
      array.select {|value| value.is_a? Integer} 
    end.flatten
  end

  def inverted_board
    @positions.transpose.map(&:reverse)
  end

end

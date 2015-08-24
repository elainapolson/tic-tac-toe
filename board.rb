class Board

  attr_accessor :positions

  def initialize
    @positions = [1, 2, 3, 4, 5, 6, 7, 8, 9] 
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

# WINNING_COMBOS = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]


  # def initialize # board position starts from 1 to 9
  #   @positions_with_values = {"1" => " ", "2" => " ", "3" => " ",
  #                             "4" => " ", "5" => " ", "6" => " ",
  #                             "7" => " ", "8" => " ", "9" => " "}


# def victory_condition(player, spot1, spot2, spot3):
#   if board[spot1] == player.symbol and tictactoe[loc2] == player.symbol and tictactoe[loc3] == player.symbol
# end

# def check_loc(player):
#     if victory_condition(player, 0, 1, 2):
#        return True
#     if victory_condition(player, 1, 4, 7):
#        return True
#     if victory_condition(player, 2, 5, 8):
#        return True
#     if victory_condition(player, 6, 7, 8):
#        return True
#     if victory_condition(player, 3, 4, 5):
#        return True
#     if victory_condition(player, 0, 3, 6):
#        return True
#     if victory_condition(player, 2, 4, 6):
#        return True
#     if victory_condition(player, 0, 4, 8)
#        return True
# end

end
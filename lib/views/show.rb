class Show

  # Initialize the boardgame with the values attached to its boardcase
  def show_board(board)
    puts "     _______________________"
    puts "    |       |       |       |"
    puts " A  |   #{board.boardcases[0].case_value}   |   #{board.boardcases[1].case_value}   |   #{board.boardcases[2].case_value}   |"
    puts "    |_______|_______|_______|"
    puts "    |       |       |       |"
    puts " B  |   #{board.boardcases[3].case_value}   |   #{board.boardcases[4].case_value}   |   #{board.boardcases[5].case_value}   |"
    puts "    |_______|_______|_______|"
    puts "    |       |       |       |"
    puts " C  |   #{board.boardcases[6].case_value}   |   #{board.boardcases[7].case_value}   |   #{board.boardcases[8].case_value}   |"
    puts "    |_______|_______|_______|"
    puts ""
    puts "        1       2       3 "
  end

end
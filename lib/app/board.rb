class Board
  attr_accessor :count_turn, :boardcases

  # Initialize the 9 boardcases of the board and a count turn
  def initialize
    @count_turn = 1
    @boardcases = []
    @boardcases << BoardCase.new('A1')
    @boardcases << BoardCase.new('A2')
    @boardcases << BoardCase.new('A3')
    @boardcases << BoardCase.new('B1')
    @boardcases << BoardCase.new('B2')
    @boardcases << BoardCase.new('B3')
    @boardcases << BoardCase.new('C1')
    @boardcases << BoardCase.new('C2')
    @boardcases << BoardCase.new('C3')
  end

  # Ask the current player which case he wants to play and change the value of the chosen case
  def play_turn(player)
    puts "Tour #{@count_turn}"
    puts "C'est au tour de #{player.name} (#{player.symbol})"
    puts "Quelle case souhaitez-vous jouer ?"
    print "> "
    boardcase_selected = gets.chomp.to_s
    # Check if boardcase_selected exists
    if @boardcases.count { |b_case| b_case.case_id.include?(boardcase_selected) } == 1
      @boardcases.each do |b_case|
        # Check if boardcase selected exists and its value has not been modified yet
        if b_case.case_id == boardcase_selected && b_case.case_value == " "
          b_case.case_value = player.symbol
        end
      end
    else
      puts "La case sélectionnée n'est pas valide"
    end
    Show.new.show_board(self)
    @count_turn += 1
  end

  # Check all the winning combinations and if there is one on the current board
  def win?
    # COLUMNS - 1
    return true if @boardcases[0].case_value == @boardcases[3].case_value && @boardcases[3].case_value == @boardcases[6].case_value && @boardcases[0].case_value != ' '
    # 2
    return true if @boardcases[1].case_value == @boardcases[4].case_value && @boardcases[4].case_value == @boardcases[7].case_value && @boardcases[1].case_value != ' '
    # 3
    return true if @boardcases[2].case_value == @boardcases[5].case_value && @boardcases[5].case_value == @boardcases[8].case_value && @boardcases[2].case_value != ' '
    # ROWS - A
    return true if @boardcases[0].case_value == @boardcases[1].case_value && @boardcases[1].case_value == @boardcases[2].case_value && @boardcases[0].case_value != ' '
    # B
    return true if @boardcases[3].case_value == @boardcases[4].case_value && @boardcases[4].case_value == @boardcases[5].case_value && @boardcases[3].case_value != ' '
    # C
    return true if @boardcases[6].case_value == @boardcases[7].case_value && @boardcases[7].case_value == @boardcases[8].case_value && @boardcases[6].case_value != ' '
    # DIAGONALS
    return true if @boardcases[0].case_value == @boardcases[4].case_value && @boardcases[4].case_value == @boardcases[8].case_value && @boardcases[0].case_value != ' '
    return true if @boardcases[6].case_value == @boardcases[4].case_value && @boardcases[4].case_value == @boardcases[2].case_value && @boardcases[6].case_value != ' '
  end

end

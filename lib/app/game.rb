class Game
  attr_accessor :current_player, :board, :status, :players_board

  # Create 2 players, one board, set the status on "ongoing", set a current player
  def initialize(player_1, player_2)
    @board = Board.new
    @status = "ongoing"
    @players_board = []
    @players_board << player_1
    @players_board << player_2
    @current_player = @players_board[rand(0..1)]
  end

  # Call other class methods : display board, ask player move, check if player won or the game is not over
  def turn
    Show.new.show_board(@board)
    @board.play_turn(@current_player)
    if @board.count_turn == 10 ||@board.win?
      game_end
    end
    # Switch current player
    if @current_player == @players_board[0]
      @current_player = @players_board[1]
    else
      @current_player = @players_board[0]
    end
  end

  # Launch a new game if players want to once a game is over
  def new_round
    @board = Board.new
    @status = 'ongoing'
    puts "Let's do another round !"
  end

  # Detect if there is a winner or if it is a draw and display the end of the game
  def game_end
    if @board.win?
      puts "\nBravo ! #{@current_player.name} a gagné ! "
    else
      puts "\nC'est une égalité !"
    end
    @status = "game end"

    # Suggests another round
    puts "Souhaitez-vous refaire une partie ? (o/n)"
    choice = gets.chomp
    if choice == "o"
      new_round
    else
      puts "A bientôt !"
    end
  end

end
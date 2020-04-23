class Application

  def welcome
    system "clear"
    puts "-" * 38
    puts "|   Bienvenue sur 'RUBY MORPION' !   |"
    puts "-" * 38
  end

  def perform
    welcome
    puts "\nJoueur 1, quel sera ton honorable nom ?"
    print "> "
    player_1_name = gets.chomp
    player_1 = Player.new(player_1_name, 'X')

    puts "\nJoueur 2, quel sera ton honorable nom ?"
    print "> "
    player_2_name = gets.chomp
    player_2 = Player.new(player_2_name, 'O')

    puts "\nJoueur 1 : #{player_1.name}, tu as les X\nJoueur 2 : #{player_2.name} tu as les O"
    game = Game.new(player_1, player_2)

    while game.status == 'ongoing'
      system "clear"
      game.turn
    end
  end

end
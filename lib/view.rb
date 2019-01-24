class View
  def welcome_screen
    puts '|| Bienvenue dans le jeu Morpion ||'
    puts "||-------------------------------||\n\n"
    create_player
  end

  def create_player
    print 'Entrer le nom du Joueur 1: '
    @player1 = gets.chomp.to_s
    puts ' '
    print 'Entrer le nom du Joueur 2: '
    @player2 = gets.chomp.to_s
    puts ' '
    sign_choice
  end
  def recup_p1
    return @player1
  end
  def recup_p2
    return @player2
  end
  def sign_choice
    puts "#{@player1} vs #{@player2}"
    puts "#{@player1} est X"
    puts "#{@player2} est O"
    print_grid
  end

  def print_grid
    puts
    puts '   1   2   3'
    puts "A  #{@a1}  | #{@a2}  | #{@a3} "
    puts '  ---|---|---'
    puts "B  #{@b1}  | #{@b2}  | #{@b3} "
    puts '  ---|---|---'
    puts "C  #{@c1}  | #{@c2}  | #{@c3} "
    puts
    #check_for_winner
  end


end

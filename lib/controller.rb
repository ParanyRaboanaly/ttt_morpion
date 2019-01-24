require_relative 'model'
require_relative 'view'

class Controller
  def initialize
    @view = View.new
  end

  def start_game
    @view.welcome_screen
    run_game
  end

  # first, I defined the new_board method to create and hold variables for empty squares on grid
  def new_board
    @a1 = ' '
    @a2 = ' '
    @a3 = ' '
    @b1 = ' '
    @b2 = ' '
    @b3 = ' '
    @c1 = ' '
    @c2 = ' '
    @c3 = ' '
  end

  # then, I defined the squares method to turn the empty squares into an array
  def squares
    [@a1, @a2, @a3, @b1, @b2, @b3, @c1, @c2, @c3]
  end

  def win_combos
    [[@a1, @a2, @a3],
     [@a1, @b2, @c3],
     [@a1, @b1, @c1],
     [@b1, @b2, @b3],
     [@c1, @c2, @c3],
     [@c1, @b2, @a3],
     [@a2, @b2, @c2],
     [@a3, @b3, @c3]]
  end

  def check_validity(square_availability)
    if square_availability == ' '
      true
    else
      puts 'That space is taken. Get your own!'
    end
  end
  def recup_H_player
    player_choice_hash = { 'a1' => @a1,
                            'a2' => @a2,
                            'a3' => @a3,
                            'b1' => @b1,
                            'b2' => @b2,
                            'b3' => @b3,
                            'c1' => @c1,
                            'c2' => @c2,
                            'c3' => @c3 }
    return player_choice_hash
  end
  def player1_turn
    recup_H_player
    @player1 = @view.recup_p1
    puts "Tour de #{@player1} : "
    player1_choice = gets.chomp.downcase
    recup_H_player.each do |choice, square|
      if player1_choice == choice
        if check_validity(square)
          square.sub!(' ', 'X')
          @view.print_grid
        end
      elsif (player1_choice == 'q') || (player1_choice == 'quit')
        exit
      end
    end
    # check_for_winner
  end

  def player2_turn
    recup_H_player
    @player2 = @view.recup_p2
    puts "Tour de #{@player2} : "
    player2_choice = gets.chomp.downcase
    player2_choice_hash.each do |choice, square|
      if player2_choice == choice
        if check_validity(square)
          square.sub!(' ', 'X')
          @view.print_grid
        end
      elsif (player2_choice == 'q') || (player2_choice == 'quit')
        exit
      end
    end
    # check_for_winner
  end

  def check_for_winner
    win_combos.each do |combos|
      if combos[0] == 'O' && combos[1] == 'O' && combos[2] == 'O'
        puts 'Computer wins! Good luck next time.'
        exit
      elsif combos[0] == 'X' && combos[1] == 'X' && combos[2] == 'X'
        puts 'You win! Good job!'
        exit
        # else
        # puts "Tie! Enter q to quit game."
      end
    end
  end
  def run_game
    new_board
    while true
      #@view.print_grid
      player1_turn
      player2_turn
    end
  end
end

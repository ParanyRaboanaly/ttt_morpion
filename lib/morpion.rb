


#the print_grid method draws a picture of the grid that holds the empty spaces from the squares array.
def print_grid
  puts
  puts "   1   2   3"
  puts "A  #{@a1} | #{@a2} | #{@a3} "
  puts "  ---|---|---"
  puts "B  #{@b1} | #{@b2} | #{@b3} "
  puts "  ---|---|---"
  puts "C  #{@c1} | #{@c2} | #{@c3} "
  puts
  check_for_winner

end





def comp_turn
  squares.shuffle.each do |square|
    if check_validity(square)
      square.gsub!(" ", "O")
      break
    end
  end
  #check_for_winner
end

def check_for_winner
  win_combos.each do |combos|
    if combos[0] == "O" && combos[1] == "O" && combos[2] == "O"
      puts "Computer wins! Good luck next time."
      exit
    elsif combos[0] == "X" && combos[1] == "X" && combos[2] == "X"
      puts "You win! Good job!"
      exit
    #else
      #puts "Tie! Enter q to quit game."
    end
  end
end

def start_game
  puts "Welcome to my Tic Tac Toe game!"
  puts "To place your X on the grid, enter the location (ex--a1, b3)."
  puts "To quit, enter q at any time"
end

def run_game
  start_game
  new_board
  while true
    print_grid
    user_turn
    comp_turn
  end
end

run_game

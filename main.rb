require_relative 'game'
require_relative 'player'
require_relative 'dealer'

# class Interface


  puts 'What is your name?'
  name = gets.chomp.capitalize
  puts "You are welcome to our Black Jack game, #{name}!"

  player = Player.new(name)
  dealer = Dealer.new

  loop do
    if player.bank_account.zero?
      puts 'You do not have enough money to play!'
      break
    elsif dealer.bank_account.zero?
      puts 'Dealer does not have enough money to play!'
      break
    end
    Game.new(player, dealer).start_game
    puts %(
      Would you like to continue playing?
      Type: y - 'yes' OR n - 'no'
    )
    choise = gets.chomp.to_s.downcase
    break unless choise == 'y'
  end





# end

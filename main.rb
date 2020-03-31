# frozen_string_literal: true

require_relative 'lib/interface'
require_relative 'lib/game'
require_relative 'lib/player'
require_relative 'lib/dealer'

@interface = Interface.new

@interface.greeting!

player = Player.new(@interface.name)
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
  choise = @interface.continue_playing?
  break if choise == 'n'
end

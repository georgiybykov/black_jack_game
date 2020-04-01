# frozen_string_literal: true

require_relative 'lib/interface'
require_relative 'lib/game'
require_relative 'lib/player'
require_relative 'lib/dealer'

game = Game.new

loop do
  if player.bank_account.zero?
    puts 'You do not have enough money to play!'
    break
  elsif dealer.bank_account.zero?
    puts 'Dealer does not have enough money to play!'
    break
  end
  game.start_game
  break if @interface.continue_playing? == 'n'
end

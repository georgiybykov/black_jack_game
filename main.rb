# frozen_string_literal: true

require_relative 'lib/game'

game = Game.new

loop do
  begin
    game.reset_cards_deck
    game.players_bets
    game.start_game
    break unless game.continue_playing?
  rescue RuntimeError => e
    puts e.message
    break
  end
end

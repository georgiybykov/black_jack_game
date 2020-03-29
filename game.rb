require_relative 'card'
require_relative 'cards_deck'
require_relative 'hand'
require_relative 'player'
require_relative 'dealer'

class Game

  BET_SIZE = 10

  def initialize(player)
    @player = Player.new(player)
    @dealer = Dealer.new
    @game_bank = 0
    @deck = CardsDeck.new
    @deck.shuffle!
    @playing = false
  end

  def start_game
    take_start_cards

    puts %(
      Player hand: #{@player.show_cards(:open)}
      Points: #{@player.show_hand_points(:open)}
      Player bank account: #{@player.bank_account - BET_SIZE}
    )
    puts %(
      Dealer hand: #{@dealer.show_cards(:hidden)}
      Points: #{@dealer.show_hand_points(:hidden)}
      Dealer bank account: #{@dealer.bank_account - BET_SIZE}
    )
    @game_bank = BET_SIZE * 2


  end

  private

  def count_results

  end

  def take_start_cards
    2.times do
      @player.hand.add_card(@deck.take_a_card)
      @dealer.hand.add_card(@deck.take_a_card)
    end
  end
end

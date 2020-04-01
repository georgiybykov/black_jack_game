# frozen_string_literal: true

class Interface
  def greeting
    puts 'Welcome to Black Jack game!'
    puts 'What is your name?'
    gets.chomp.capitalize
  end

  def continue_playing?
    puts %(
    Would you like to continue playing?
    Type: y - 'yes' OR n - 'no'
    )
    true if gets.chomp.to_s.downcase == 'y'
  end

  def show_game_info(player, dealer, choise)
    puts %(
      #{player.name}'s hand: #{player.hand.show_cards}
      Points: #{player.points}
      #{player.name}'s bank account: #{player.bank_account} $
    )
    puts %(
      Dealer hand: #{dealer.show_hand_cards(choise)}
      Points: #{dealer.show_hand_points(choise)}
      Dealer bank account: #{dealer.bank_account} $
    )
  end

  def player_step_menu
    puts %(
      Type number to make a step:
        1. Skip step
        2. Add card
        3. Open cards
    )
  end

  def show_winner(player)
    puts 'It is a tie!' if player.nil?
    puts "Winner is #{player.name}"
    puts "Winner bank account is #{player.bank_account} $"
  end

  def show_tie(player, dealer)
    puts "It is a tie between #{player.name} and #{dealer.name}!"
    puts "#{player.name} bank account is #{player.bank_account} $"
    puts "#{dealer.name} bank account is #{dealer.bank_account} $"
  end

  def show_game_bank(game_bank)
    puts "Game bank: #{game_bank} $"
  end

  def black_jack?
    puts 'Black Jack!'
  end

  def not_right_step?
    puts 'It is a mistake. Type right step number!'
  end
end

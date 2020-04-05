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
      Dealer's hand: #{dealer.show_hand_cards(choise)}
      Points: #{dealer.show_hand_points(choise)}
      Dealer's bank account: #{dealer.bank_account} $
    )
  end

  def player_step_menu
    puts %(
      Type a number to make the next step:
        1. Skip a step
        2. Add a card
        3. Open cards
    )
  end

  def show_round_winner(player)
    if player.nil?
      puts 'It is a tie!'
    else
      puts "The winner is #{player.name}"
      puts "#{player.name}'s bank account is #{player.bank_account} $"
    end
  end

  def show_tie(player, dealer)
    puts "It is a tie between #{player.name} and #{dealer.name}!"
    puts "#{player.name} bank account is #{player.bank_account} $"
    puts "#{dealer.name} bank account is #{dealer.bank_account} $"
  end

  def show_game_winner(player)
    if player.nil?
      puts 'It is a tie!'
    else
      puts "The game is over! The winner is #{player.name} with #{player.bank_account} $."
    end
  end

  def show_game_bank(game_bank)
    puts "The game bank is: #{game_bank} $"
  end

  def black_jack?
    puts 'Black Jack!'
  end

  def not_right_step?
    puts 'It is a mistake. Type a right number of the step!'
  end

  def error?(e)
    puts e.message
  end
end

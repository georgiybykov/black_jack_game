


class Interface
  attr_reader :name, :choise


  def greeting!
    puts 'What is your name?'
    name = gets.chomp.capitalize
    puts "You are welcome to our Black Jack game, #{name}!"
  end

  def continue_playing?
    puts %(
    Would you like to continue playing?
    Type: any button - 'yes' OR n - 'no'
    )
    gets.chomp.to_s.downcase
  end

  # def enough_money?
  #   if player.bank_account.zero?
  #     puts 'You do not have enough money to play!'
  #     break
  #   elsif dealer.bank_account.zero?
  #     puts 'Dealer does not have enough money to play!'
  #     break
  #   end
  # end
end

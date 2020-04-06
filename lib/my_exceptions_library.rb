# frozen_string_literal: true

class MyExceptionsLibrary
  class NoMoneyError < StandardError
  end

  class PlayerNoMoneyError < NoMoneyError
    def message
      'You do not have enough money to play!'
    end
  end

  class DealerNoMoneyError < NoMoneyError
    def message
      'Dealer does not have enough money to play!'
    end
  end
end

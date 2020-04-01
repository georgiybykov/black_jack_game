class PlayerDoesntHaveMoney < RuntimeError
  def message
    'You do not have enough money to play!'
  end
end

class DealerDoesntHaveMoney < RuntimeError
  def message
    'Dealer does not have enough money to play!'
  end
end

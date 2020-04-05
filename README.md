# Black Jack Game project

### How to start playing?

To run the Black Jack game execute the command in your terminal:

          ruby ./main.rb

Then type your name and press < Enter > button. It will start the game round.

          Welcome to Black Jack game!
          What is your name?
          <........your_name........>

### Round interface

          The game bank is: 20 $

          Player's hand: [["Jack", "♥"], ["King", "♠"]]
          Points: 20
          Player's bank account: 90 $

          Dealer's hand: [["*", "*"], ["*", "*"]]
          Points: **
          Dealer's bank account: 90 $

          Type a number to make the next step:
            1. Skip a step
            2. Add a card
            3. Open cards

First line gives you the information about game bank. It consists of player's and dealer's bets.

The following two areas show the player's or dealer's hand, amount of points in a hand and balance of bank account.

Then you have a choise to make some step from the list. They are described in the following menu.

(Some rules: you are able to have only three cards in your hand. In this case, the step number 2 will open your and the dealer's cards.)

### The end of the Round

          The winner is Player
          Player's bank account is 110 $

                Would you like to continue playing?
                  Type: y - 'yes' OR n - 'no'


The round will be finished. The program will count the winner of the round.

On this step, you should to decide whether to continue playing or not.
(Type 'y' OR 'n' and press < Enter > button.)

### The end of the Game

If you choose 'n', the game will be over and you will see the result of the game.

          The game is over! The winner is Player with 110 $.



#### Good Luck!

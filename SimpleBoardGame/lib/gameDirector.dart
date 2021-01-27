import 'dart:math';

class GameDirector {
  int diceNumber = 0;
  int turnNum = 0;
  int player1PositionX = 0;
  int player2PositionX = 0;

  int rollDie() {
    diceNumber = Random().nextInt(6) + 1;
    return diceNumber;
  }

  void checkTurn() {
    if (turnNum == 1) {
      player1PositionX += diceNumber;
    }
    if (turnNum == 2) {
      player2PositionX += diceNumber;
    }

    turnNum++;

    if (turnNum > 2) {
      turnNum = 1;
    }
  }

  int getPlayer1PositionX() {
    return this.player1PositionX;
  }

  int getPlayer2PositionX() {
    return this.player2PositionX;
  }
}

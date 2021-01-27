import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mi_card/gameDirector.dart';
import 'dart:math';
import 'package:mi_card/make_board_game.dart';
import 'constants.dart';

class BoardGame extends StatefulWidget {
  @override
  _BoardGameState createState() => _BoardGameState();
}

class _BoardGameState extends State<BoardGame> {
  MakeBoardGame makeBoardGame = new MakeBoardGame();
  GameDirector gameDirector = new GameDirector();

  //initialising state variables
  //diceNumber is the result after dice roll, initialised as 1

  //starting positions of player, top left hand corner (0, 0)
/*  int player1PositionX = 0;*/
  int player1PositonY = 0;

/*  int player2PositionX = 0;*/
  int player2PositonY = 0;

  int turnNum = 1;

  bool winFlag = false;

  //TODO: save the state of the game when player presses back and comes back to the game

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //display the boardGame once we entered the page
    makeBoardGame.makeMap(gameDirector.player1PositionX, player1PositonY,
        gameDirector.player2PositionX, player2PositonY, boardSizeY, boardSizeX);
  }

/*  //function to roll a die
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
  }*/

  //color tile according to player's dice roll
  void colorTheTile() {
    gameDirector.diceNumber = gameDirector.rollDie();
    gameDirector.checkTurn();

    print(gameDirector.player1PositionX);
    print('----');
    print(gameDirector.diceNumber);
    print('\n');

    //update playerPositions
    if (gameDirector.player1PositionX >= boardSizeX) {
      gameDirector.player1PositionX =
          gameDirector.player1PositionX - boardSizeX;
      player1PositonY++;

      //at the top force it back to the bottom
      if (player1PositonY >= boardSizeY) {
        player1PositonY = 0;
      }
    }

    if (gameDirector.player2PositionX >= boardSizeX) {
      gameDirector.player2PositionX =
          gameDirector.player2PositionX - boardSizeX;
      player2PositonY++;

      //at the top force it back to the bottom
      if (player2PositonY >= boardSizeY) {
        player2PositonY = 0;
      }
    }

    makeBoardGame.makeMap(gameDirector.player1PositionX, player1PositonY,
        gameDirector.player2PositionX, player2PositonY, boardSizeY, boardSizeX);

    alert();

    if (winFlag == true) {
      gameDirector.player1PositionX = 0;
      player1PositonY = 0;
      player2PositonY = 0;
      gameDirector.player2PositionX = 0;

      winFlag = false;
      makeBoardGame.makeMap(
          gameDirector.player1PositionX,
          player1PositonY,
          gameDirector.player2PositionX,
          player2PositonY,
          boardSizeY,
          boardSizeX);
    }
  }

  //function to alert player
  dynamic alert() {
    if (gameDirector.player1PositionX == boardSizeX - 1 &&
        player1PositonY == boardSizeY - 1) {
      winFlag = true;

      return showDialog(
        context: context,
        builder: (context) {
          return WinAlert(
            alertMessage: 'PLAYER 1 WINS',
          );
        },
      );
    }
    if (gameDirector.player2PositionX == boardSizeX - 1 &&
        player2PositonY == boardSizeY - 1) {
      winFlag = true;

      return showDialog(
        context: context,
        builder: (context) {
          return WinAlert(
            alertMessage: 'PLAYER 2 WINS',
          );
        },
      );
    }

    if (gameDirector.player1PositionX == 2 && player1PositonY == 2) {
      player1PositonY = 1;
      return showDialog(
        context: context,
        builder: (context) {
          return WinAlert(
            alertMessage: 'HOLE!',
          );
        },
      );
    }
    if (gameDirector.player1PositionX == 2 && player1PositonY == 3) {
      player1PositonY = 6;
      return showDialog(
        context: context,
        builder: (context) {
          return WinAlert(
            alertMessage: 'TELEPORT!',
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                children: makeBoardGame.getY(),
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Go back'),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        colorTheTile();
                      });
                      /*return showDialog(
                        context: context,
                        builder: (context) {
                          return WinAlert(
                            alertMessage: 'WIN',
                          );
                        },
                      );*/
                    },
                    child: Text('Roll Diee'),
                  ),
                  Text(gameDirector.diceNumber.toString()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}

class WinAlert extends StatelessWidget {
  String alertMessage;
  WinAlert({this.alertMessage});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(alertMessage),
    );
  }
}

/*

return showDialog(
context: context,
builder: (context) {
return WinAlert(
alertMessage: 'WIN',
);
},
);*/

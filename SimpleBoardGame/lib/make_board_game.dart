import 'package:flutter/material.dart';

class MakeBoardGame {
/*  List<Widget> _x = [];*/

  //a map with tiles styled accordingly to player position x and y
  List<Widget> map = [];

  /*void makeX(int indexY) {
    for (int indexX = 0; indexX < 2; indexX++) {
      this._x.add(
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color:
                      //indexX == 3 &&
                      indexY == 2 ? Colors.lime : Colors.white,
                  border: Border.all(
                    color: Colors.black,
                    width: 1.0,
                  ),
                ),
              ),
            ),
          );
    }
  }*/

/*  void makeY() {
    this._x.clear();
    this._y.clear();

    for (int indexY = 0; indexY < 3; indexY++) {
      //this._x.clear();
      //makeX(indexY);
      this._y.add(
            Expanded(
              child: Row(children: this._x),
            ),
          );
    }
  }*/

  //makeMap makes the entire map with that corresponding colored tile marked by ppX and ppY
  //everytime this method gets called, the existing map is destroyed and a new one is made
  void makeMap(int player1PositionX, int player1PositionY, int player2PositionX,
      int player2PositionY, int boardSizeY, int boardSizeX) {
    double iconSize = 20;
    this.map.clear();
    for (int boardY = 0; boardY < boardSizeY; boardY++) {
      List<Widget> XrowList = [];
      for (int boardX = 0; boardX < boardSizeX; boardX++) {
        XrowList.add(
          Expanded(
            child: Container(
              //child not added for Container, can consider adding child
              child: Column(
                children: <Widget>[
                  boardY == player1PositionY && boardX == player1PositionX
                      ? Icon(
                          Icons.face,
                          size: iconSize,
                          color: Colors.black,
                        )
                      : Container(),
                  boardY == player2PositionY && boardX == player2PositionX
                      ? Icon(
                          Icons.face,
                          size: iconSize,
                          color: Colors.red,
                        )
                      : Container(),
                  boardY == boardSizeY - 1 && boardX == boardSizeX - 1
                      ? Text('END')
                      : Container(),
                  boardY == 2 && boardX == 2
                      ? Icon(
                          Icons.run_circle_rounded,
                          size: iconSize,
                          color: Colors.black,
                        )
                      : Container(),
                  boardY == 3 && boardX == 2
                      ? Icon(
                          Icons.ac_unit,
                          size: iconSize,
                          color: Colors.blueAccent,
                        )
                      : Container(),
                ],
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 1.0,
                ),
              ),
            ),
          ),
        );
      }
      this.map.add(
            Expanded(
              child: Row(children: XrowList),
            ),
          );
    }
  }

  //add child method for Container, testing in progress
  Widget addChild(Widget containerchild) {
    return containerchild;
  }

  List<Widget> getY() {
    return this.map;
  }
}

import 'package:flutter/material.dart';
import 'package:mi_card/boardgame_page.dart';

class SelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade900,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Card(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              color: Colors.white,
              child: ListTile(
                leading: Icon(
                  Icons.videogame_asset,
                  color: Colors.teal.shade900,
                  size: 40,
                ),
                title: Text(
                  'Multiplayer',
                  style: TextStyle(
                    color: Colors.teal.shade900,
                    fontFamily: 'OpenSans',
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            GestureDetector(
              //added a button to navigate between pages
              onTap: () {
                Navigator.pop(context);
              },
              child: Card(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                color: Colors.white,
                child: ListTile(
                  leading: Icon(
                    Icons.face,
                    color: Colors.teal.shade900,
                    size: 40,
                  ),
                  title: Text(
                    'Play with AI',
                    style: TextStyle(
                      color: Colors.teal.shade900,
                      fontFamily: 'OpenSans',
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BoardGame()),
                );
              },
              child: Text('Play Game'),
            )
          ],
        ),
      ),
    );
  }
}

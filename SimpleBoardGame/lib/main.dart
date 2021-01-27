import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mi_card/selection_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: MyHome(),
  ));
}

class MyHome extends StatelessWidget {
  String userName = 'Zoe';

  //create controller for user input
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    /*super.dispose();*/
  }

  @override
  Widget build(BuildContext context) {
    _read();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black26,
        title: Text(
          'Board Game',
        ),
      ),
      backgroundColor: Colors.blueGrey.shade900,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage('images/gameIcon.png'),
            ),
            Text(
              'Board Game1',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'Pacifico',
              ),
            ),
            Text(
              'Board Game when you are Bored',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'OpenSans',
                letterSpacing: 1.5,
              ),
            ),
            SizedBox(
              height: 10.0,
              width: 300,
              child: Divider(
                color: Colors.teal.shade100,
              ),
            ),
            Card(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(
                        Icons.phone,
                        color: Colors.teal.shade900,
                      ),
                      title: TextField(
                        controller: myController,
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter User Name',
                        ),
                      ), /*Text(
                        userName,
                        style: TextStyle(
                          color: Colors.teal.shade900,
                          fontFamily: 'OpenSans',
                          fontSize: 20,
                        ),
                      ),*/
                    ),
                  ],
                )),
            GestureDetector(
              onTap: () {
                _save();
              },
              child: Card(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                color: Colors.white,
                child: ListTile(
                  leading: Icon(
                    Icons.email,
                    color: Colors.teal.shade900,
                  ),
                  title: TextField(
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter Password',
                    ),
                  ), /* Text(
                    'doge@dogemail.com',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'OpenSans',
                      color: Colors.teal.shade900,
                    ),
                  ),*/
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                /* _save();
                return showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      // Retrieve the text the that user has entered by using the
                      // TextEditingController.
                      content: Text(myController.text),
                    );
                  },
                );*/
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SelectionPage()),
                );
              },
              child: Text('Play Game'),
            ),
          ],
        ),
      ),
    );
  }

  _read() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'UserName';
    myController.text = prefs.getString(key) ?? "Test";
    print('read: $myController.text');
  }

  _save() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'UserName';
    final value = myController.text;
    prefs.setString(key, value);
    print(myController.text);
  }
}

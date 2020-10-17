import 'package:flutter/material.dart';

class EphemeralHome extends StatefulWidget {
  @override
  _EphemeralHomeState createState() => _EphemeralHomeState();
}

class _EphemeralHomeState extends State<EphemeralHome> {
  String _greeting = "Hello World";
  void changeState(String newText) {
    setState(() {
      _greeting = newText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Simple BLoC'),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(child: Text('$_greeting', style: TextStyle(fontSize: 35, color: Colors.blueAccent),),),
              Container(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      child: FlatButton(
                          color: Colors.blue,
                          onPressed: () {
                            changeState('Howdy');
                          },
                          child: Text(
                            'Howdy',
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                    Container(
                      child: FlatButton(
                          color: Colors.green,
                          onPressed: () {
                            changeState("What's up!");
                          },
                          child: Text(
                            "What's up!",
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                    Container(
                      child: FlatButton(
                          color: Colors.orange,
                          onPressed: () {
                            changeState("You're Rock!");
                          },
                          child: Text(
                            "You're Rock!",
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

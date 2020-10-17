import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MyModel>(
      //                                <--- Provider
      create: (context) => MyModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(title: Text('My App')),
          body: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MyButton(), //Button is not rebulit.

              Container(
                padding: const EdgeInsets.all(35),
                color: Colors.blue[200],
                child: Consumer<MyModel>(
                  //                    <--- Consumer rebuilt ui.
                  builder: (context, myModel, child) {
                    return Text(myModel.someValue);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final myModel = Provider.of<MyModel>(context, listen: false);
    return Container(
      padding: EdgeInsets.all(20.0),
      color: Colors.green[200],
      child: RaisedButton(
        child: Text('Do something'),
        onPressed: () {
          myModel.doSomething();
        },
      ),
    );
  }
}

class MyModel with ChangeNotifier {
  //                                               <--- MyModel
  String someValue = 'Hello';
  void doSomething() {
    someValue = 'Goodbye';
    print(someValue);
    notifyListeners();
  }
}

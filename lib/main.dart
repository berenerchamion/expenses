import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Flutter App'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              child: Text('THIS IS THE CHART!'),
              color: Colors.green,
              elevation: 5,
            ), //Card
            // alignment: Alignment.center,
          ), //Container
          Card(
            child: Container(
              child: Text('LIST OF TX'),
              width: double.infinity,
              alignment: Alignment.center,
            ),
            elevation: 5,
            color: Colors.yellow,
          ), //Card
        ],
      ), //Widget //Column
    );
  }
}

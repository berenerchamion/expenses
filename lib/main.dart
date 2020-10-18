import 'package:flutter/material.dart';
import './transaction.dart';

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
  final List<Transaction> transactions = [
    Transaction(
      id: '1',
      title: 'Headphones',
      amount: 74.45,
      date: DateTime.now(),
    ),
    Transaction(
      id: '2',
      title: 'Sneakers',
      amount: 135.45,
      date: DateTime.utc(2020, 6, 6),
    ),
    Transaction(
      id: '3',
      title: 'MacBook Pro',
      amount: 2035.45,
      date: DateTime.utc(2017, 9, 11),
    ),
    Transaction(
      id: '4',
      title: 'Nespresso Gold',
      amount: 235.45,
      date: DateTime.utc(2019, 3, 16),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Flutter App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              child: Text(
                'THIS IS THE CHART!',
                textAlign: TextAlign.center,
              ),
              color: Colors.green,
              elevation: 5,
            ), //Card
          ), //Container
          Column(
            children: transactions.map((tx) {
              return Card(
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Text(tx.amount.toStringAsPrecision(2)),
                    ), //Container
                    Column(
                      children: <Widget>[
                        Text(
                          tx.title,
                        ),
                        Text(
                          tx.date.toString(),
                        ),
                      ],
                    ), //Column
                  ],
                ), //<Widget> //Row
              ); //Card
            }).toList(),
          ), //Column
        ],
      ), //Widget //Column
    );
  }
}

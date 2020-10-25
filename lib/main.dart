import 'package:flutter/material.dart';
import 'widgets/expense_list.dart';
import 'widgets/new_expense.dart';

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
          ), //Container CHART
          NewExpense(),
          ExpenseList(),
        ],
      ), //Widget // Main Column
    );
  }
}

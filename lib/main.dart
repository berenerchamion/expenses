import 'package:flutter/material.dart';
import 'widgets/transaction_list.dart';

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

  final titleController = TextEditingController();
  final amountController = TextEditingController();

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
          Card(
            elevation: 5,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Title",
                    ),
                    controller: titleController,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        labelText: "Amount",
                    ),
                    controller: amountController,
                  ),
                  FlatButton(
                    child: Text('Add Expense'),
                    textColor: Colors.deepPurple,
                    onPressed: () {
                      print(titleController.text);
                      print(amountController.text);
                    },
                  ), //FlatButton
                ],
              ),
            ),
          ), //End Card
          TransactionList(),
        ],
      ), //Widget // Main Column
    );
  }
}

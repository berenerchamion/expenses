import 'package:flutter/material.dart';

class NewExpense extends StatelessWidget {
  final Function addExpense;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewExpense(this.addExpense);

  @override
  Widget build(BuildContext context) {
    return Card(
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
                addExpense(
                  titleController.text,
                  double.parse(amountController.text),
                  DateTime.now(),
                );
              },
            ), //FlatButton
          ],
        ),
      ),
    ); //End Card
  }
}

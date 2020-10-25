import 'package:flutter/material.dart';

class NewExpense extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

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
                print(titleController.text);
                print(amountController.text);
              },
            ), //FlatButton
          ],
        ),
      ),
    ); //End Card
  }
}

import 'package:flutter/material.dart';

class NewExpense extends StatelessWidget {
  final Function addExpense;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewExpense(this.addExpense);

  void newExp() {
    final title = titleController.text;
    final amount = double.tryParse(amountController.text);

    if (title.isEmpty || amount <= 0 || amount == null) {
      return;
    }

    addExpense(
      titleController.text,
      double.parse(amountController.text),
      DateTime.now(),
    );
  }

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
              onSubmitted: (_) => newExp(),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "Amount",
              ),
              controller: amountController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => newExp(),
              //ok that goofy _ means well this is a stupid thing about
              //not using an argument that I have to use, but this means I am
              //not going to use it. stupid.
            ),
            FlatButton(
              child: Text('Add Expense'),
              textColor: Colors.deepPurple,
              onPressed: newExp,
            ), //FlatButton
          ],
        ),
      ),
    ); //End Card
  }
}

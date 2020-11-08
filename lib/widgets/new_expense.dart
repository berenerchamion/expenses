import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewExpense extends StatefulWidget {
  final Function addExpense;

  NewExpense(this.addExpense);

  @override
  _NewExpenseState createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;

  void _newExp() {
    final title = _titleController.text;

    if (_amountController.text.isEmpty) {
      return;
    }

    final amount = double.tryParse(_amountController.text);

    if (title.isEmpty ||
        amount <= 0 ||
        amount == null ||
        _selectedDate == null) {
      return;
    }

    widget.addExpense(
      _titleController.text,
      double.parse(_amountController.text),
      _selectedDate,
    );

    Navigator.of(context).pop();
  }

  void _displayDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((date) {
      if (date != null) {
        _selectedDate = date;
      } else {
        return;
      }
      setState(() {
        _selectedDate = date;
      });
    });
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
              controller: _titleController,
              onSubmitted: (_) => _newExp(),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "Amount",
              ),
              controller: _amountController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => _newExp(),
              //ok that goofy _ means well this is a stupid thing about
              //not using an argument that I have to use, but this means I am
              //not going to use it. stupid.
            ),
            Container(
              height: 75,
              child: Row(
                children: <Widget>[
                  Text(
                    _selectedDate == null
                        ? 'No date chosen'
                        : 'Date: ${DateFormat.yMd().format(_selectedDate)}',
                  ),
                  Expanded(
                    child: FlatButton(
                      textColor: Theme.of(context).primaryColor,
                      child: Text(
                        'Choose Date',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ), //Text
                      onPressed: _displayDatePicker,
                    ),
                  ),
                ],
              ),
            ),
            RaisedButton(
              child: Text('Add Expense'),
              color: Theme.of(context).primaryColor,
              textColor: Theme.of(context).textTheme.button.color,
              onPressed: _newExp,
            ), //FlatButton
          ],
        ),
      ),
    ); //End Card
  }
}

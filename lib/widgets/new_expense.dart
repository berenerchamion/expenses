import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import './adaptive_button.dart';

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

  @override
  void initState() {
    super.initState();
  }

  void _newExp() {

    print('_newExp Constructor');
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
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
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
                      child: AdaptiveButton('Choose Date', _displayDatePicker, false),
                    ),
                  ],
                ),
              ),
              AdaptiveButton ('Add Expense', _newExp, true),
            ],
          ),
        ),
      ), //End Card
    );
  }
}

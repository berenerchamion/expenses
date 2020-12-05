import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/expense.dart';

class ExpenseItem extends StatefulWidget {
  const ExpenseItem({
    Key key,
    @required this.expense,
    @required this.deleteExp,
  }) : super(key: key);

  final Expense expense;
  final Function deleteExp;

  @override
  _ExpenseItemState createState() => _ExpenseItemState();
}

class _ExpenseItemState extends State<ExpenseItem> {
  Color _bgColor;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    const availableColors = [
      Colors.red,
      Colors.green,
      Colors.purple,
      Colors.blue
    ];
    _bgColor = availableColors[Random().nextInt(4)];
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);

    return Card(
      margin: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 3,
      ),
      elevation: 3,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _bgColor,
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: FittedBox(
              child: Text('\$${widget.expense.amount}'), //Text
            ), //FittedBox
          ), //Padding
        ), //CircleAvatar
        title: Text(
          widget.expense.title,
          style: theme.textTheme.headline6,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(widget.expense.date),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
            fontStyle: FontStyle.italic,
            color: theme.accentColor,
          ),
        ),
        trailing: mediaQuery.size.width > 360
            ? FlatButton.icon(
                icon: Icon(Icons.delete),
                label: const Text('Delete'),
                textColor: theme.errorColor,
                onPressed: () => widget.deleteExp(widget.expense.id),
              )
            : IconButton(
                icon: Icon(
                  Icons.delete,
                  color: theme.errorColor,
                ),
                onPressed: () => widget.deleteExp(widget.expense.id),
              ),
      ),
    );
  }
}

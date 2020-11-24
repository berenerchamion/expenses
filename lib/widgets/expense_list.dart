import 'package:expenses/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/expense.dart';

class ExpenseList extends StatelessWidget {
  final List<Expense> expenses;
  final Function deleteExp;

  ExpenseList(this.expenses, this.deleteExp);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);

    return Container(
      child: expenses.isEmpty
          ? LayoutBuilder(builder: (ctx, constraints) {
              return (Column(
                children: <Widget>[
                  Text(
                    'No expenses added yet.',
                    style: theme.textTheme.headline6,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    height: constraints.maxHeight * 0.6,
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ) //Column
                  );
            })
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  margin: EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 3,
                  ),
                  elevation: 3,
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: FittedBox(
                          child: Text('\$${expenses[index].amount}'), //Text
                        ), //FittedBox
                      ), //Padding
                    ), //CircleAvatar
                    title: Text(
                      expenses[index].title,
                      style: theme.textTheme.headline6,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(expenses[index].date),
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
                            label: Text('Delete'),
                            textColor: theme.errorColor,
                            onPressed: () => deleteExp(expenses[index].id),
                          )
                        : IconButton(
                            icon: Icon(
                              Icons.delete,
                              color: theme.errorColor,
                            ),
                            onPressed: () => deleteExp(expenses[index].id),
                          ),
                  ),
                ); //ListTile
              },
              itemCount: expenses.length,
            ),
    ); //Column TX
  }
}

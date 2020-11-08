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
    return Container(
      height: 500,
      child: expenses.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'No expenses added yet.',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  height: 350,
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ) //Column
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
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(expenses[index].date),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        fontStyle: FontStyle.italic,
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Theme.of(context).errorColor,
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

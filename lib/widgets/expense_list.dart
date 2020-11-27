
import 'package:flutter/material.dart';
import '../models/expense.dart';
import 'expense_item.dart';

class ExpenseList extends StatelessWidget {
  final List<Expense> expenses;
  final Function deleteExp;

  ExpenseList(this.expenses, this.deleteExp);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      child: expenses.isEmpty
          ? LayoutBuilder(builder: (ctx, constraints) {
              return (Column(
                children: <Widget>[
                  Text(
                    'No expenses added yet.',
                    style: theme.textTheme.headline6,
                  ),
                  const SizedBox(
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
                return ExpenseItem(expense: expenses[index], deleteExp: this.deleteExp);
              },
              itemCount: expenses.length,
            ),
    ); //Column TX
  }
}

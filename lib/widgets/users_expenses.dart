import 'package:flutter/material.dart';
import './expense_list.dart';
import './new_expense.dart';
import '../models/expense.dart';

class UsersExpenses extends StatefulWidget {
  @override
  _UsersExpensesState createState() => _UsersExpensesState();
}

class _UsersExpensesState extends State<UsersExpenses> {
  final List<Expense> _usersExpenses = [
    Expense(
      id: '1',
      title: 'Headphones',
      amount: 74.45,
      date: DateTime.now(),
    ),
    Expense(
      id: '2',
      title: 'Sneakers',
      amount: 135.45,
      date: DateTime.utc(2020, 6, 6),
    ),
    Expense(
      id: '3',
      title: 'MacBook Pro',
      amount: 2035.45,
      date: DateTime.utc(2017, 9, 11),
    ),
    Expense(
      id: '4',
      title: 'Nespresso Gold',
      amount: 235.45,
      date: DateTime.utc(2019, 3, 16),
    ),
  ];

  void _addNewExpense (String title, double amount, DateTime date) {
    final newExpense = Expense(
      title: title,
      amount: amount,
      date: date,
      id: DateTime.now().toString(),
    );

    setState(() {
      _usersExpenses.add(newExpense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget> [
        NewExpense(_addNewExpense),
        ExpenseList(_usersExpenses),
      ],
    );
  }
}

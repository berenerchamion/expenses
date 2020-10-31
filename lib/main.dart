import 'package:flutter/material.dart';
import 'widgets/expense_list.dart';
import 'widgets/new_expense.dart';
import 'models/expense.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Beren\'s Expenses',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        accentColor: Colors.blueGrey[300],
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          foregroundColor: Colors.amber,
          backgroundColor: Colors.deepPurple,
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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

  void _addNewExpense(String title, double amount, DateTime date) {
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

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (bCtx) {
        return NewExpense(_addNewExpense);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Beren\'s Expenses'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddNewTransaction(context),
          ),
        ], //Widget[]
      ), //AppBar
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ), //End FAB
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                child: Text(
                  'THIS IS THE CHART!',
                  textAlign: TextAlign.center,
                ),
                color: Colors.green,
                elevation: 5,
              ),
            ),
            ExpenseList(_usersExpenses),
          ],
        ),
      ),
    );
  }
}

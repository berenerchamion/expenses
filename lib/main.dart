import "dart:io";

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'models/expense.dart';
import 'widgets/expense_list.dart';
import 'widgets/new_expense.dart';
import 'widgets/chart.dart';

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
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: const TextStyle(
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
              button: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          foregroundColor: Colors.white,
          backgroundColor: Colors.deepPurple,
        ),
        fontFamily: 'Quicksand',
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: const TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
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
  final List<Expense> _usersExpenses = [];

  bool _showChart = false;

  List<Expense> get _weeklyExpenses {
    return _usersExpenses.where((exp) {
      return exp.date.isAfter(DateTime.now().subtract(
        Duration(days: 7),
      ));
    }).toList();
  }

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

  void _deleteExpense(String id) {
    setState(() {
      //_usersExpenses.removeWhere((exp) => exp.id == id);
      _usersExpenses.removeWhere((exp) {
        return exp.id == id;
      });
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
    final _mediaQuery = MediaQuery.of(context);
    final bool _isLandscape = _mediaQuery.orientation == Orientation.landscape;

    final PreferredSizeWidget appBar = Platform.isIOS
        ? CupertinoNavigationBar(
            middle: const Text('Beren\'s Expenses'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                GestureDetector(
                  child: const Icon(CupertinoIcons.add),
                  onTap: () => _startAddNewTransaction(context),
                ),
              ],
            ),
          )
        : AppBar(
            title: const Text('Beren\'s Expenses'),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () => _startAddNewTransaction(context),
              ),
            ], //Widget[]
          );

    final Widget _expListWidget = Container(
      height: (_mediaQuery.size.height -
              appBar.preferredSize.height -
              _mediaQuery.padding.top) *
          0.7,
      child: ExpenseList(_usersExpenses, _deleteExpense),
    );

    List<Widget> _buildLandscapeContent() {
      return [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Show Chart', style: Theme.of(context).textTheme.headline5),
            Switch.adaptive(
              activeColor: Theme.of(context).accentColor,
              value: _showChart,
              onChanged: (val) {
                setState(() {
                  _showChart = val;
                });
              },
            ),
          ],
        ),
        _showChart
            ? Container(
                height: (_mediaQuery.size.height -
                        appBar.preferredSize.height -
                        _mediaQuery.padding.top) *
                    0.7,
                child: Chart(_weeklyExpenses),
              )
            : _expListWidget,
      ];
    }

    List<Widget> _buildPortraitContent(
        MediaQueryData mq, AppBar ab, Widget expList) {
      return [
        Container(
          height:
              (mq.size.height - ab.preferredSize.height - mq.padding.top) * 0.3,
          child: Chart(_weeklyExpenses),
        ),
        expList,
      ];
    }

    var body = SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (_isLandscape) ..._buildLandscapeContent(),
            if (!_isLandscape)
              ..._buildPortraitContent(_mediaQuery, appBar, _expListWidget),
          ],
        ),
      ),
    );

    return Platform.isIOS
        ? CupertinoPageScaffold(
            child: body,
            navigationBar: appBar,
          )
        : Scaffold(
            appBar: appBar, //AppBar
            floatingActionButton: Platform.isIOS
                ? Container()
                : FloatingActionButton(
                    child: Icon(Icons.add),
                    onPressed: () => _startAddNewTransaction(context),
                  ), //End FAB
            body: body,
          );
  }
}

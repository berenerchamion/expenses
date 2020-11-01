import 'package:expenses/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/expense.dart';
import './chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Expense> weeklyExpenses;
  Chart(this.weeklyExpenses);

  List<Map<String, Object>> get dailyExpenseValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      double dailyTotal = 0.0;

      for (int i = 0; i < weeklyExpenses.length; i++) {
        if (weeklyExpenses[i].date.day == weekDay.day &&
            weeklyExpenses[i].date.month == weekDay.month &&
            weeklyExpenses[i].date.year == weekDay.year) {
          dailyTotal += weeklyExpenses[i].amount;
        }
      }

      return {
        'day': DateFormat.Md().format(weekDay),
        'amount': dailyTotal,
      };
    }).reversed.toList();
  }

  double get totalExpensesForWeek {
    return weeklyExpenses.fold(0.0, (sum, item) {
      return sum + item.amount;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(dailyExpenseValues);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: dailyExpenseValues.map((exp) {
            return Expanded(
              child: ChartBar(
                exp['day'],
                exp['amount'],
                totalExpensesForWeek == 0.0
                    ? 0.0
                    : (exp['amount'] as double) / totalExpensesForWeek,
              ), //ChartBar
            ); //Expanded
          }).toList(),
        ), //Row
      ), //Padding
    ); //Card
  }
}

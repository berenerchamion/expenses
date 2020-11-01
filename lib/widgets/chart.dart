import 'package:expenses/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/expense.dart';

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
      print(DateFormat.E().format(weekDay));
      print(dailyTotal);

      return {
        'day': DateFormat.E().format(weekDay),
        'amount': dailyTotal,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    print(dailyExpenseValues);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: dailyExpenseValues.map(
            (exp) {
              return Text('${exp['day']}: ${exp['amount']}');
            }
        ).toList(),
      ),
    );
  }
}

import 'package:expenses/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/expense.dart';

class ExpenseList extends StatelessWidget {
  final List<Expense> expenses;

  ExpenseList(this.expenses);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return Card(
              elevation: 5,
              child: Row(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    margin: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 15,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      border: Border.all(
                        width: 2,
                        color: Colors.deepPurple,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      '\$${expenses[index].amount.toStringAsFixed(2)}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.deepPurple),
                    ),
                  ), //Container
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        expenses[index].title,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.black),
                      ),
                      Text(
                        DateFormat.yMMMd().format(expenses[index].date),
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Colors.blueGrey[300],
                        ),
                      ),
                    ],
                  ), //Column
                ],
              ), //<Widget> //Row
            ); //Card
          },
          itemCount: expenses.length,
        ),
    ); //Column TX
  }
}

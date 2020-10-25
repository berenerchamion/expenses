import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatefulWidget {
  @override
  _TransactionListState createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  final List<Transaction> _usersExpenses = [
    Transaction(
      id: '1',
      title: 'Headphones',
      amount: 74.45,
      date: DateTime.now(),
    ),
    Transaction(
      id: '2',
      title: 'Sneakers',
      amount: 135.45,
      date: DateTime.utc(2020, 6, 6),
    ),
    Transaction(
      id: '3',
      title: 'MacBook Pro',
      amount: 2035.45,
      date: DateTime.utc(2017, 9, 11),
    ),
    Transaction(
      id: '4',
      title: 'Nespresso Gold',
      amount: 235.45,
      date: DateTime.utc(2019, 3, 16),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return           Column(
      children: _usersExpenses.map((tx) {
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
                  '\$${tx.amount}',
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
                    tx.title,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black),
                  ),
                  Text(
                    DateFormat.yMMMd().format(tx.date),
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
      }).toList(),
    ); //Column TX
  }
}

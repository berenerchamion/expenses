import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String weekday;
  final double expAmount;
  final double expPercentOfTotal;

  ChartBar(this.weekday, this.expAmount, this.expPercentOfTotal);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 20,
          child: FittedBox(
            child: Text('\$${expAmount.toStringAsFixed(0)}'),
          ), //FittedBox
        ), //container
        SizedBox(
          height: 4,
        ),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            children: <Widget>[
              Container(
                alignment: Alignment.topCenter,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).accentColor,
                    width: 1.0,
                  ),
                  color: Color.fromRGBO(220, 220, 220, 1),
                  borderRadius: BorderRadius.all(Radius.circular(2)),
                ), //BoxDecoration
              ), //Container
              FractionallySizedBox(
                heightFactor: expPercentOfTotal,
                alignment: Alignment.bottomCenter,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                  ),
                ),
              ), //FractionallySizedBox
            ], //Widget
          ), //Stack
        ), //Container
        SizedBox(
          height: 4,
        ),
        Text(weekday),
      ],
    );
  }
}

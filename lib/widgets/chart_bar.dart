import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String weekday;
  final double expAmount;
  final double expPercentOfTotal;

  ChartBar(this.weekday, this.expAmount, this.expPercentOfTotal);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraint){
        return Column(
          children: <Widget>[
            Container(
              height: constraint.maxHeight * 0.10,
              child: FittedBox(
                child: Text('\$${expAmount.toStringAsFixed(0)}'),
              ), //FittedBox
            ), //container
            SizedBox(
              height: constraint.maxHeight * 0.05,
            ),
            Container(
              height: constraint.maxHeight * 0.7,
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
              height: constraint.maxHeight * 0.05,
            ),
            Container(
              height: constraint.maxHeight * 0.10,
              child: FittedBox(
                child: Text(weekday),
              ),
            ),
          ],
        );
    },);
  }
}

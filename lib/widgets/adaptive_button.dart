import "dart:io";

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class AdaptiveButton extends StatelessWidget {
  final String buttonText;
  final Function handler;
  final bool raisedButton;

  AdaptiveButton(this.buttonText, this.handler, this.raisedButton);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            child: Text(
              buttonText,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: handler,
          )
        : raisedButton
            ? RaisedButton(
                child: const Text('Add Expense'),
                color: Theme.of(context).primaryColor,
                textColor: Theme.of(context).textTheme.button.color,
                onPressed: handler,
              )
            : FlatButton(
                textColor: Theme.of(context).primaryColor,
                child: Text(
                  buttonText,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: handler,
              );
  }
}

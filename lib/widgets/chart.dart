//import
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class Chart extends StatelessWidget {
  //props
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  //list of object for chart
  List<Map<String, Object>> get groupTransactionsValue {
    return List.generate(7, (index) {
      //getting days
      final weekDay = DateTime.now().subtract(Duration(days: index));
      //getting full amount
      var totalAmount = 0.0;
      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalAmount += recentTransactions[i].amount;
        }
      }
      return {
        'day': DateFormat.E(weekDay),
        'amount': totalAmount,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

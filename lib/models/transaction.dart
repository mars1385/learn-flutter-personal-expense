//import
import 'package:flutter/foundation.dart';

class Transaction {
  //props
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  //counstructor
  Transaction({
    @required this.id,
    @required this.title,
    @required this.amount,
    @required this.date,
  });
}

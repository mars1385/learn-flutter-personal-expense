//import
import 'package:flutter/material.dart';

//our weidgets
import './new_transaction.dart';
import './transaction_list.dart';

//trnsaction class
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  //our transaction list
  final List<Transaction> _userTransactions = [
    Transaction(
      id: 't1',
      title: 'new hats',
      amount: 15.64,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'new jens',
      amount: 25.69,
      date: DateTime.now(),
    ),
  ];
  //methodes
  //add new transaction
  void _addNewTransaction(String txTitle, double txAmount) {
    final newTransaction = Transaction(
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_addNewTransaction),
        TransactionList(_userTransactions),
      ],
    );
  }
}

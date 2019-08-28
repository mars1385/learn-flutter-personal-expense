//import
import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  //props
  final Function addTransaction;
  //input handler

  NewTransaction(this.addTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();

  final _amountController = TextEditingController();

  void onSubmit() {
    final textSubmited = _titleController.text;
    final amountSubmited = double.parse(_amountController.text);
    if (textSubmited.isEmpty || amountSubmited <= 0) return;
    widget.addTransaction(
      textSubmited,
      amountSubmited,
    );
    //closing
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: _titleController,
              onSubmitted: (_) => onSubmit(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: _amountController,
              onSubmitted: (_) => onSubmit(),
              keyboardType: TextInputType.number,
            ),
            FlatButton(
              textColor: Colors.purple,
              child: Text('Add Transaction'),
              onPressed: onSubmit,
            ),
          ],
        ),
      ),
    );
  }
}

//import
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  //props
  final Function addTransaction;
  //input handler

  NewTransaction(this.addTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  //props
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _pickedDate;
  //submit data
  void _onSubmit() {
    if (_amountController.text.isEmpty) {
      return;
    }
    final textSubmited = _titleController.text;
    final amountSubmited = double.parse(_amountController.text);
    if (textSubmited.isEmpty || amountSubmited <= 0 || _pickedDate == null)
      return;
    widget.addTransaction(
      textSubmited,
      amountSubmited,
      _pickedDate,
    );
    //closing
    Navigator.of(context).pop();
  }

  //choose date
  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((date) {
      if (date == null) {
        return;
      }
      setState(() {
        _pickedDate = date;
      });
    });
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
              onSubmitted: (_) => _onSubmit(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: _amountController,
              onSubmitted: (_) => _onSubmit(),
              keyboardType: TextInputType.number,
            ),
            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      _pickedDate == null
                          ? 'No date!'
                          : 'Picked Date: ${DateFormat.yMd().format(_pickedDate)}',
                    ),
                  ),
                  FlatButton(
                    textColor: Theme.of(context).primaryColor,
                    child: Text(
                      'Choose Date',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: _showDatePicker,
                  ),
                ],
              ),
            ),
            RaisedButton(
              color: Theme.of(context).primaryColor,
              child: Text(
                'Add Transaction',
                style: Theme.of(context).textTheme.button,
              ),
              onPressed: _onSubmit,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:expense_planner/models/Transaction.dart';
import 'package:expense_planner/widgets/transaction_list.dart';
import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';

import 'new_transaction.dart';

class UserTransaction extends StatefulWidget{

  @override
  _UserTransactionState createState() {
    // TODO: implement createState
    return _UserTransactionState();
  }
}

class _UserTransactionState extends State<UserTransaction> {

  final List<Transaction> _userTransaction = [
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Weekly groceries',
      amount: 29.99,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransaction(String txTitle, double txAmount){
    final newTx = Transaction(
      title: txTitle,
      amount:  txAmount,
      date: DateTime.now(),
      id: DateTime.now().toString()
    );

    setState(() {
      _userTransaction.add(newTx);
    });
  }


  @override
  Widget build(BuildContext context) {
return Column(
  children: <Widget>[
    NewTransaction(_addNewTransaction),
    TransactionList(_userTransaction),
  ],
);
  }
}
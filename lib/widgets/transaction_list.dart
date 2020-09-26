import 'package:expense_planner/models/Transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/Transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
            child: ListView(
              children: transactions.map((tx) {
                return Card(
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 15,
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.purple, width: 2)),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          '\$${tx.amount.toString()}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.purple),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            tx.title,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            //DateFormat('yyyy/MM/dd').format(tx.date),  // 1 way
                            DateFormat.yMMMd().format(tx.date), //2nd way
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      )
                    ],
                  ),
                );
              }).toList(),
        )
    );
  }
}

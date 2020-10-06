import 'package:expense_planner/models/Transaction.dart';
import 'package:expense_planner/widgets/transaction_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/Transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx) {
    print("Constructor TransactionList");
  }

  @override
  Widget build(BuildContext context) {
    print("Build() TransactionList");
    return Container(
      height: 400,
      child: transactions.isEmpty
          ? LayoutBuilder(
              builder: (context, constraints) {
                return Column(
                  children: <Widget>[
                    Text(
                      'No transactions added yet',
                      style: Theme.of(context).textTheme.title,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        height: constraints.maxHeight * 0.6,
                        child: Image.asset(
                          'assets/images/waiting.png',
                          fit: BoxFit.cover,
                        )),
                  ],
                );
              },
            )
          : ListView(
              children: <Widget>[
                ...transactions // iterating for each item
                    .map((tx) => TransactionItem(
                          key: ValueKey(tx.id),
                          transactions: tx,
                          deleteTx: deleteTx,
                        ))
                    .toList()
              ],
            ),
      /*----------------------------------------TODO building above listview with using keys for unqiue ID of item----------------------------------------------------------------*/

      // : ListView.builder(
      //     // colon is of ternary operator
      //     itemBuilder: (ctx, index) {
      //       return  TransactionItem(transactions: transactions[index], deleteTx: deleteTx);
      //     },
      //     itemCount: transactions.length,
      //   ));
    );
  }
}

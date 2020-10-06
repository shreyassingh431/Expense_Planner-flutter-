import 'dart:math';

import 'package:expense_planner/models/Transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatefulWidget {
  const TransactionItem({
    Key key,
    @required this.transactions,
    @required this.deleteTx,
  }) : super(key: key);

  final Transaction transactions;
  final Function deleteTx;

  @override
  _TransactionItemState createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  Color _choosenBgColour;

  @override
  void initState() {
    const availableColours = [Colors.red, Colors.orange,Colors.purple, Colors.blue];

    _choosenBgColour = availableColours[Random().nextInt(4)];
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _choosenBgColour,
          radius: 30,
          child: Padding(
            padding: EdgeInsets.all(6),
            child: FittedBox(
              child: Text('\$${widget.transactions.amount}'),
            ),
          ),
        ),
        title: Text(
          widget.transactions.title,
          style: Theme.of(context).textTheme.title,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(widget.transactions.date),
        ),
        trailing: MediaQuery.of(context).size.width >360
            ? FlatButton.icon(
            icon:Icon(Icons.delete),
            textColor: Theme.of(context).errorColor,
            label: Text('Delete'),
            onPressed: () => widget.deleteTx( widget.transactions.id))
            : IconButton(
          icon: Icon(Icons.delete),
          color: Theme.of(context).errorColor,
          onPressed: () => widget.deleteTx( widget.transactions.id),
        ),
      ),

      /* child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 15,
            ),
            decoration: BoxDecoration(
                border: Border.all(
                    color: Theme.of(context).primaryColor,
                    width: 2)),
            padding: EdgeInsets.all(10),
            child: Text(
              '\$${transactions[index].amount.toStringAsFixed(2)}',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(transactions[index].title,
                  style: Theme.of(context).textTheme.title),
              Text(
                //DateFormat('yyyy/MM/dd').format(tx.date),  // 1 way
                DateFormat.yMMMd()
                    .format(transactions[index].date),
                //2nd way
                style: TextStyle(color: Colors.grey),
              )
            ],
          )
        ],
      ),*/
    );
  }


}
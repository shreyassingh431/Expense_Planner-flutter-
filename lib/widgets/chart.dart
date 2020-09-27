import 'package:expense_planner/models/Transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);


  List<Map<String, String>> get groupedTransactionValues {
    return List.generate(7, (index) {  // second parameter is nothing but its taking method
      final weekDay = DateTime.now().subtract(Duration(days: index),);
      var totalSum = 0.0;

      for(var i=0; i< recentTransactions.length; i++){
        if(recentTransactions[i].date.day == weekDay.day && recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year){
          totalSum += recentTransactions[i].amount;
        }

      }

      print(DateFormat.E().format(weekDay));
      print(totalSum.toString());
      return {'day': DateFormat.E().format(weekDay), 'amount': totalSum.toString()};
    });
  }


  @override
  Widget build(BuildContext context) {

    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(children: <Widget>[
      ],),
    );
  }

}
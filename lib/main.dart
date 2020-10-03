import 'package:expense_planner/widgets/chart.dart';
import 'package:expense_planner/widgets/transaction_list.dart';
import 'package:expense_planner/widgets/user_transaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'models/Transaction.dart';
import 'widgets/new_transaction.dart';

//void main() => runApp(MyApp());
void main() {
  //WidgetsFlutterBinding.ensureInitialized(); // need to call before setPreferredOrientations in latest version of flutter
  //SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown]);  //force portrait
   runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Planner',
      theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepPurpleAccent,
          errorColor: Colors.red,
          fontFamily: 'Quicksand',
          textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
                button: TextStyle(color: Colors.white),
              ),
          appBarTheme: AppBarTheme(
              textTheme: ThemeData.light().textTheme.copyWith(
                  title: TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 20,
                      fontWeight: FontWeight.bold)))),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
      amount: 9.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Weekly groceries',
      amount: 19.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Weekly groceries',
      amount: 29.99,
      date: DateTime.now(),
    ),

    Transaction(
      id: 't2',
      title: 'Weekly groceries',
      amount: 49.99,
      date: DateTime.now(),
    ),
  ];

  List<Transaction> get _recentTransactions {
    //calculating all transaction younger then 7 days
    return _userTransaction.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _addNewTransaction(String txTitle, double txAmount, DateTime choosenDate) {
    final newTx = Transaction(
        title: txTitle,
        amount: txAmount,
        date: choosenDate,
        id: DateTime.now().toString());

    setState(() {
      _userTransaction.add(newTx);
    });
  }

  void _deleteTransaction(String id){
    setState(() {
      _userTransaction.removeWhere((tx) {
        return tx.id == id;

      });
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewTransaction(_addNewTransaction ),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final appbar = AppBar(
      title: Text('Expense Planner'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () => _startAddNewTransaction(context),
        )
      ],
    );
    return Scaffold(
      appBar: appbar,
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            height: (MediaQuery.of(context).size.height - appbar.preferredSize.height - MediaQuery.of(context).padding.top) * 0.3,
              child: Chart(_recentTransactions)),
          //UserTransaction()
          Container(
              height: (MediaQuery.of(context).size.height - appbar.preferredSize.height - MediaQuery.of(context).padding.top) * 0.7,
              child: TransactionList(_userTransaction, _deleteTransaction))
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import './transaction_item.dart';
import './transaction.dart';
import './transaction_form.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Expense Planner', home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Transaction> _transactions = [
    Transaction(
      id: "1",
      title: "Pikachu Coffee Mug",
      amount: 45.49,
      date: DateTime.now(),
    ),
    Transaction(
      id: "2",
      title: "Marshmellow Socks",
      amount: 29.99,
      date: DateTime.now(),
    )
  ];

  void addTransaction(Map<String, String> transactionData) {
    setState(() {
      _transactions.add(Transaction(
        id: (_transactions.length + 1).toString(),
        title: transactionData['title'],
        amount: double.parse(transactionData['amount']),
        date: DateTime.now(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Expense Planner'),
        ),
        body: Column(
          children: <Widget>[
            Card(child: Text('CHART PLACEHOLDER')),
            TransactionForm(
              onSave: addTransaction,
            ),
            Column(
              children: _transactions.map((transaction) {
                return TransactionItem(transaction);
              }).toList(),
            )
          ],
        ));
  }
}

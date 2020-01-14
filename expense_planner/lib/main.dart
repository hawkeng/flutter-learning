import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Expense Planner', home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  final List<Transaction> transactions = [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Expense Planner'),
        ),
        body: Column(
          children: <Widget>[
            Card(child: Text('CHART PLACEHOLDER')),
            Column(
              children: transactions.map((transaction) {
                return ExpenseItem(transaction);
              }).toList(),
            )
          ],
        ));
  }
}

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.transaction, {Key key}) : super(key: key);

  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    final dFormatter = new DateFormat.yMMMd().add_jm();

    return Card(
      child: Row(
        children: <Widget>[
          Container(
            // color: Colors.orange,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.purple, width: 2)),
            child: Text(
              '\$${transaction.amount}',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.purple),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                transaction.title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                dFormatter.format(transaction.date.toLocal()),
                style: TextStyle(color: Colors.grey),
              ),
            ],
          )
        ],
      ),
    );
  }
}

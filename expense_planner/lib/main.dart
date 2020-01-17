import 'package:flutter/material.dart';

import './transaction_item.dart';
import './transaction.dart';
import './transaction_form.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Planner',
      home: HomePage(),
      theme: ThemeData(primarySwatch: Colors.purple),
    );
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
    ),
    Transaction(
      id: "3",
      title: "Darth Vader T-shirt",
      amount: 29.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: "4",
      title: "Luke Skywalker Lightsaber",
      amount: 29.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: "5",
      title: "Rick and Morty Hoodie",
      amount: 29.99,
      date: DateTime.now(),
    )
  ];

  void _addTransaction(Map<String, String> transactionData) {
    final String title = transactionData['title'];
    final String amount = transactionData['amount'];

    if (title.isEmpty || amount.isEmpty) return;

    final double amountNumber = double.parse(amount);
    if (amountNumber <= 0) return;

    setState(() {
      _transactions.add(Transaction(
        id: (_transactions.length + 1).toString(),
        title: title,
        amount: amountNumber,
        date: DateTime.now(),
      ));
    });
  }

  void _openTransactionForm(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return TransactionForm(onSave: (data) {
          _addTransaction(data);
          Navigator.of(ctx).pop();
        });
      },
    );
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
          Expanded(
            flex: 1,
            child: ListView.builder(
              itemCount: _transactions.length,
              itemBuilder: (ctx, i) => TransactionItem(_transactions[i]),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: IconButton(
          icon: Icon(Icons.add),
          onPressed: () => _openTransactionForm(context),
        ),
      ),
    );
  }
}

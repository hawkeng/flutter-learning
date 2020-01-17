import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './transaction.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem(this.transaction, {Key key}) : super(key: key);

  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    final dFormatter = new DateFormat.yMMMd().add_jm();

    return Card(
      child: Row(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.purple, width: 2)),
            child: Text(
              '\$${transaction.amount.toStringAsFixed(2)}',
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

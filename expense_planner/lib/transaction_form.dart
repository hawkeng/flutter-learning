import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  TransactionForm({Key key, @required this.onSave}) : super(key: key);

  final Function onSave;

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(labelText: 'Title'),
            controller: titleController,
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Amount'),
            // iOS Fix
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            controller: amountController,
          ),
          FlatButton(
            child: Text('Add Transaction'),
            textColor: Theme.of(context).primaryColor,
            onPressed: () {
              widget.onSave({
                'title': titleController.text,
                'amount': amountController.text
              });
            },
          )
        ],
      ),
    );
  }
}

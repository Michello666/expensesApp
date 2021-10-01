import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function createTransaction;

  NewTransaction(this.createTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitTransaction() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    widget.createTransaction(enteredTitle, enteredAmount);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: "Tile"),
              controller: titleController,
              onSubmitted: (_) => submitTransaction(),
              // onChanged: (val) => titleInput = val,
            ),
            TextField(
              decoration: InputDecoration(labelText: "Amount"),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitTransaction(),
              // onChanged: (val) => amountInput = val,
            ),
            TextButton(
              onPressed: submitTransaction
              ,
              child: Text(
                "Add transaction",
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            )
          ],
        ),
      ),
    );
  }
}

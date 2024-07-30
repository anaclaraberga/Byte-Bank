import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: TransferList(),
      appBar: AppBar(
        title: const Text('Transferências'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          return null;
        },
      ),
    ),
  ));
}

class TransferList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        TransferItem('100.00', 'Conta: 2944'),
        TransferItem('50.00', 'Conta: 2964'),
        TransferItem('160.00', 'Conta: 2454'),
      ],
    );
  }
}

class TransferItem extends StatelessWidget {
  final String value;
  final String accountNumber;

  const TransferItem(this.value, this.accountNumber);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      leading: Icon(Icons.monetization_on),
      title: Text(value),
      subtitle: Text(accountNumber),
    ));
  }
}

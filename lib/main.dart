import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: TransferList(),
      appBar: AppBar(
        title: Text('Transferências'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
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
    return Column(
      children: [
        TransferItem(Transfer(100.00, 'Conta:9876')),
        TransferItem(Transfer(70.00, 'Conta:2176')),
        TransferItem(Transfer(165.00, 'Conta:0129')),
      ],
    );
  }
}

class TransferItem extends StatelessWidget {
  final Transfer transfer;

  TransferItem(this.transfer);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      leading: Icon(Icons.monetization_on),
      title: Text(transfer.value.toString()),
      subtitle: Text(transfer.accountNumber),
    ));
  }
}

class Transfer {
  final double value;
  final String accountNumber;

  Transfer(this.value, this.accountNumber);
}

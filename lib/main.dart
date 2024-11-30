import 'package:flutter/material.dart';

void main() => runApp(ByteBankApp());

class ByteBankApp extends StatelessWidget {
  const ByteBankApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: TransferForm(),
      ),
    );
  }
}

class TransferForm extends StatelessWidget {
  const TransferForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Transferências'),
        ),
        body: Column(
          children: [
            TransferItem(Transfer(100.00, 9876)),
            TransferItem(Transfer(70.00, 1042)),
            TransferItem(Transfer(165.00, 0854)),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            return;
          },
        ));
  }
}

class TransferList extends StatelessWidget {
  const TransferList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransferItem(Transfer(100.00, 9876)),
        TransferItem(Transfer(70.00, 1042)),
        TransferItem(Transfer(165.00, 0854)),
      ],
    );
  }
}

class TransferItem extends StatelessWidget {
  final Transfer transfer;

  const TransferItem(this.transfer, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      leading: const Icon(Icons.monetization_on),
      title: Text(transfer.value.toString()),
      subtitle: Text('Conta: ${transfer.accountNumber.toString()}'),
    ));
  }
}

class Transfer {
  final double value;
  final int accountNumber;

  Transfer(this.value, this.accountNumber);
}

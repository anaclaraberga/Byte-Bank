import 'package:flutter/material.dart';

void main() => runApp(const ByteBankApp());

class ByteBankApp extends StatelessWidget {
  const ByteBankApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: MakeTransfer(),
      ),
    );
  }
}

class MakeTransfer extends StatelessWidget {
  const MakeTransfer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Realizar nova transferência'),
        ),
        body: const Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(24.0),
              child: TextField(
                style: TextStyle(fontSize: 16.0),
                decoration: InputDecoration(
                    labelText: 'Número da conta', hintText: '0000'),
                keyboardType: TextInputType.numberWithOptions(),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(24.0),
              child: TextField(
                style: TextStyle(fontSize: 16.0),
                decoration: InputDecoration(
                    labelText: 'Valor da transferência',
                    hintText: '0000',
                    icon: Icon(Icons.monetization_on)),
                keyboardType: TextInputType.numberWithOptions(),
              ),
            ),
            ElevatedButton(onPressed: null, child: Text("Confirmar"))
          ],
        ));
  }
}

class TransferDashboard extends StatelessWidget {
  const TransferDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Transferências'),
        ),
        body: const TransferList(),
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
        TransferItem(Transfer(74.00, 1042)),
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

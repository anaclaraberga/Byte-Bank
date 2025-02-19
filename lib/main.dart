// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() => runApp(ByteBankApp());

class ByteBankApp extends StatelessWidget {
  const ByteBankApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: MakeTransfer(),
      ),
    );
  }
}

class MakeTransfer extends StatelessWidget {
  MakeTransfer({super.key});

  final TextEditingController _controllerAccountField = TextEditingController();
  final TextEditingController _controllerValueField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Realizar nova transferência'),
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(24.0),
              child: TextField(
                controller: _controllerValueField,
                style: TextStyle(fontSize: 16.0),
                decoration: InputDecoration(
                    labelText: 'Número da conta', hintText: '0000'),
                keyboardType: TextInputType.numberWithOptions(),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(24.0),
              child: TextField(
                controller: _controllerAccountField,
                style: TextStyle(fontSize: 16.0),
                decoration: InputDecoration(
                    labelText: 'Valor da transferência',
                    hintText: '0000',
                    icon: Icon(Icons.monetization_on)),
                keyboardType: TextInputType.numberWithOptions(),
              ),
            ),
            FilledButton(
              onPressed: () {
                debugPrint("Confirmado!");
                final int accountNumber =
                    int.parse(_controllerAccountField.text);
                final double value = double.parse(_controllerValueField.text);

                Transfer(value, accountNumber);
              },
              style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                      Color.fromRGBO(8, 154, 124, 0.612))),
              child: Container(
                height: 50,
                width: 200,
                alignment: Alignment.center,
                child: Text("Enviar"),
              ),
            )
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
          title: Text('Transferências'),
          shape: BeveledRectangleBorder(),
        ),
        body: TransferList(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
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
      leading: Icon(Icons.monetization_on),
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

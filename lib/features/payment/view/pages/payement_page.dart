import 'package:flutter/material.dart';
import 'package:flutter_application/features/payment/view/widgets/credit_card_form.dart';

class PayementPage extends StatefulWidget {
  const PayementPage({super.key});

  @override
  State<PayementPage> createState() => _PayementPageState();
}

class _PayementPageState extends State<PayementPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Confirm Payment", style: TextStyle(fontWeight: FontWeight.bold)), centerTitle: true),
      body: Padding(padding: EdgeInsets.all(16), child: CreditCardForm()),
    );
  }
}

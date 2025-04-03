import 'package:flutter/material.dart';
import 'package:flutter_application/features/payment/view/widgets/credit_card_form.dart';
import 'package:flutter_application/features/reservation/view/widgets/countdown_timer.dart';

class PayementPage extends StatefulWidget {
  final int screeningId;
  const PayementPage({super.key, required this.screeningId});

  @override
  State<PayementPage> createState() => _PayementPageState();
}

class _PayementPageState extends State<PayementPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [CountdownTimer()],
        title: Text("Confirm Payment", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Padding(padding: EdgeInsets.all(16), child: CreditCardForm(screeningId: widget.screeningId)),
    );
  }
}

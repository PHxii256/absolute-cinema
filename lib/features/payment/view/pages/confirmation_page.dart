import 'package:flutter/material.dart';
import 'package:flutter_application/features/home/view/pages/my_home_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PaymentConfirmation extends ConsumerWidget {
  const PaymentConfirmation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text("Thank You!"),
        leading: BackButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil<void>(
              context,
              MaterialPageRoute<void>(builder: (BuildContext context) => const MyHomePage(title: 'Absolute Cinema')),
              ModalRoute.withName('/home'),
            );
          },
        ),
      ),
      body: Expanded(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(
              "Successfuly Booked Tickets! You can now find them in the tickets tab =)",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}

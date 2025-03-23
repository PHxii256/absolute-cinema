import 'package:flutter/material.dart';
import 'package:flutter_application/features/payment/view/pages/payement_page.dart';
import 'package:flutter_application/features/reservation/view/widgets/price_calculator.dart';
import 'package:flutter_application/features/reservation/view/widgets/theater_legend.dart';
import 'package:flutter_application/features/reservation/view/widgets/theater_seats.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../mock/theater_data_mock.dart';

class BookingPage extends ConsumerWidget {
  const BookingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text("Pick Seats", style: TextStyle(fontWeight: FontWeight.bold)), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  TheaterSeatsViewer(theaterSeatingData: data),
                  SizedBox(height: 8),
                  Center(child: Legend()),
                  SizedBox(height: 8),
                  PriceCalculator(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Additional Info", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                        Text("Theater Hall: Hall(1)"),
                        Text("Screen Type: IMAX"),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: FilledButton.tonal(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => PayementPage()));
                },
                child: Padding(padding: const EdgeInsets.symmetric(horizontal: 80), child: Text("Checkout")),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

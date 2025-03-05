import 'package:flutter/material.dart';
import 'package:flutter_application/features/reservation/model/theater_model.dart';
import 'package:flutter_application/features/reservation/viewmodel/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PriceCalculator extends ConsumerWidget {
  const PriceCalculator({super.key});

  int getTotalPrice(List<SeatData> seats) {
    int runningTotal = 0;
    for (int i = 0; i < seats.length; i++) {
      runningTotal += seats[i].price;
    }
    return runningTotal;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<SeatData> reservedSeats = ref.watch(reservedSeatsProvider);
    final int vipSeatsCount = reservedSeats.where((seat) => seat.isVip).length;
    final int normalSeatsCount = reservedSeats.length - vipSeatsCount;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child:
          reservedSeats.isNotEmpty
              ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Price: ${getTotalPrice(reservedSeats)} LE",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  vipSeatsCount != 0 ? Text("${vipSeatsCount}x vip seat") : Container(),
                  normalSeatsCount != 0 ? Text("${normalSeatsCount}x normal seat") : Container(),
                ],
              )
              : Container(),
    );
  }
}

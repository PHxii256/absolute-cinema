import 'package:flutter/material.dart';
import 'package:flutter_application/features/reservation/model/seat_status_data.dart';
import 'package:flutter_application/features/reservation/viewmodel/seat_status_notifier.dart';
import 'package:flutter_application/features/search/model/movie_airing_info.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_application/features/reservation/viewmodel/seat_layout_notifier.dart';

class PriceCalculator extends ConsumerWidget {
  final MovieAiringInfo airingInfo;
  const PriceCalculator({super.key, required this.airingInfo});

  int getTotalPrice(List<SeatStatusData> seats) {
    int runningTotal = 0;
    for (int i = 0; i < seats.length; i++) {
      if (!seats[i].booked) runningTotal += seats[i].price;
    }
    return runningTotal;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isleLayoutList = ref.watch(seatLayoutProvider(airingInfo));
    final reservedSeatsStatus = ref.watch(seatStatusProvider(airingInfo.screeningId));

    if (!isleLayoutList.hasValue || !reservedSeatsStatus.hasValue) return Container();

    final nonBookedReservedSeats = reservedSeatsStatus.value!.where((seat) => !seat.booked).toList();
    final int vipSeatsCount = nonBookedReservedSeats.where((seat) => seat.isVip).length;
    final int normalSeatsCount = nonBookedReservedSeats.length - vipSeatsCount;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Builder(
        builder: (context) {
          if (!reservedSeatsStatus.hasValue) {
            if (reservedSeatsStatus.isLoading) {
              return Center(child: SizedBox(width: 40, height: 40, child: CircularProgressIndicator()));
            } else {
              return Container();
            }
          }
          return nonBookedReservedSeats.isNotEmpty
              ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Price: ${getTotalPrice(reservedSeatsStatus.value!)} LE",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  vipSeatsCount != 0 ? Text("${vipSeatsCount}x vip seat") : Container(),
                  normalSeatsCount != 0 ? Text("${normalSeatsCount}x normal seat") : Container(),
                ],
              )
              : Container();
        },
      ),
    );
  }
}

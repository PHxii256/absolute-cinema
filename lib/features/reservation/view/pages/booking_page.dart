import 'package:flutter/material.dart';
import 'package:flutter_application/features/payment/view/widgets/credit_card_form.dart';
import 'package:flutter_application/features/reservation/view/widgets/countdown_timer.dart';
import 'package:flutter_application/features/reservation/view/widgets/price_calculator.dart';
import 'package:flutter_application/features/reservation/view/widgets/theater_legend.dart';
import 'package:flutter_application/features/reservation/view/widgets/theater_seats.dart';
import 'package:flutter_application/features/reservation/viewmodel/countdown_notifier.dart';
import 'package:flutter_application/features/reservation/viewmodel/seat_status_notifier.dart';
import 'package:flutter_application/features/search/model/movie_airing_info.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookingPage extends ConsumerStatefulWidget {
  final int movieId;
  final int theaterId;
  final MovieAiringInfo airingInfo;
  const BookingPage({super.key, required this.movieId, required this.theaterId, required this.airingInfo});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BookingPageState();
}

class _BookingPageState extends ConsumerState<BookingPage> {
  bool selectedSeatsNotEmpty = false;

  @override
  Widget build(BuildContext contex) {
    ref.listen(seatStatusProvider(widget.airingInfo.screeningId), (previous, next) {
      setState(() {
        setState(() {
          selectedSeatsNotEmpty =
              ref
                  .read(seatStatusProvider(widget.airingInfo.screeningId).notifier)
                  .getNonBookedReservedSeats()
                  .isNotEmpty;
        });
      });
    });

    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        ref.read(countdownProvider.notifier).cancelTimer();
        ref
            .read(seatStatusProvider(widget.airingInfo.screeningId).notifier)
            .deleteAllReservedSeats(widget.airingInfo.screeningId);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.airingInfo.theaterName, style: TextStyle(fontWeight: FontWeight.bold)),
          centerTitle: true,
          actions: [CountdownTimer()],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    TheaterSeatsViewer(airingInfo: widget.airingInfo),
                    SizedBox(height: 8),
                    Center(child: Legend()),
                    SizedBox(height: 8),
                    PriceCalculator(airingInfo: widget.airingInfo),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Additional Info", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                          Text("Theater Hall: ${widget.airingInfo.hallName}"),
                          Text("Screen Type: ${widget.airingInfo.hallScreen}"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: FilledButton.tonal(
                  onPressed:
                      selectedSeatsNotEmpty
                          ? () {
                            showModalBottomSheet(
                              showDragHandle: true,
                              barrierColor: const Color.fromARGB(144, 0, 0, 0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(6),
                                  topRight: Radius.circular(6),
                                ),
                              ),
                              context: context,
                              builder: (context) {
                                return SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.44,
                                  width: double.infinity,
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: SingleChildScrollView(
                                      child: CreditCardForm(screeningId: widget.airingInfo.screeningId),
                                    ),
                                  ),
                                );
                              },
                            );
                          }
                          : null,
                  child: Padding(padding: const EdgeInsets.symmetric(horizontal: 80), child: Text("Checkout")),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

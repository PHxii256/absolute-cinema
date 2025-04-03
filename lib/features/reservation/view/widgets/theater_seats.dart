import 'package:flutter/material.dart';
import 'package:flutter_application/features/reservation/model/isle_layout_data.dart';
import 'package:flutter_application/features/reservation/model/seat_status_data.dart';
import 'package:flutter_application/features/reservation/model/theater_model.dart';
import 'package:flutter_application/features/reservation/viewmodel/countdown_notifier.dart';
import 'package:flutter_application/features/reservation/viewmodel/seat_layout_notifier.dart';
import 'package:flutter_application/features/reservation/viewmodel/seat_status_notifier.dart';
import 'package:flutter_application/features/search/model/movie_airing_info.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';

const double seatSize = 34;
const double seatGap = 8;
const double isleGap = 14;

class TheaterSeatsViewer extends ConsumerStatefulWidget {
  //TO DO: convert to stateless?
  final MovieAiringInfo airingInfo;

  const TheaterSeatsViewer({super.key, required this.airingInfo});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TheaterSeatsViewerState();
}

class _TheaterSeatsViewerState extends ConsumerState<TheaterSeatsViewer> {
  @override
  Widget build(BuildContext context) {
    final isleLayoutList = ref.watch(seatLayoutProvider(widget.airingInfo));
    return Column(
      children: [
        SizedBox(height: 20),
        SizedBox(
          width: 150,
          height: 30,
          child: DecoratedBox(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), color: Colors.black),
            child: Center(
              child: Text("screen", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600)),
            ),
          ),
        ),

        SizedBox(
          height: 440,
          child: switch (isleLayoutList) {
            AsyncData(:final value) =>
              value.isNotEmpty
                  ? SeatsViewer(isleData: value, airingInfo: widget.airingInfo)
                  : Center(child: Text("No seating data found")),
            AsyncError() => const Text('Oops, something unexpected happened'),
            _ => Center(child: SizedBox(width: 40, height: 40, child: const CircularProgressIndicator())),
          },
        ),
      ],
    );
  }
}

class SeatsViewer extends StatelessWidget {
  final List<IsleLayoutData> isleData;
  final MovieAiringInfo airingInfo;
  const SeatsViewer({super.key, required this.isleData, required this.airingInfo});

  int colCount() {
    int colCount = 0;
    for (var isle in isleData) {
      colCount += isle.rowSeatCount;
    }
    return colCount;
  }

  @override
  Widget build(BuildContext context) {
    const double offsetPerSeat = 5.5; //magic number to center the view (found through testing)

    return SingleChildScrollView(
      controller: ScrollController(initialScrollOffset: offsetPerSeat * colCount()),
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        height: 600,
        child: Row(
          spacing: isleGap,
          children: [for (int i = 0; i < isleData.length; i++) Isle(isleData: isleData[i], airingInfo: airingInfo)],
        ),
      ),
    );
  }
}

class Isle extends ConsumerWidget {
  final IsleLayoutData isleData;
  final MovieAiringInfo airingInfo;
  const Isle({super.key, required this.isleData, required this.airingInfo});

  bool isGapRow(int i) {
    if (isleData.gapRowIndexes == null) {
      return false;
    } else if (isleData.gapRowIndexes!.contains(i)) {
      return true;
    }
    return false;
  }

  bool isVipRow(int i) {
    return isleData.vipRowIndexes != null ? isleData.vipRowIndexes!.contains(i) : false;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: isleData.rowSeatCount * (seatSize + seatGap) + seatGap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 40),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(8.0),
              scrollDirection: Axis.vertical,
              children: [
                for (int i = 0; i < isleData.rowCount; i++)
                  !isGapRow(i)
                      ? TheaterRow(
                        seatCount: isleData.rowSeatCount.toDouble(),
                        startingSeatIndex: i * isleData.rowSeatCount.toInt(),
                        isleID: isleData.isleCode,
                        isVip: isVipRow(i),
                        price:
                            isVipRow(i)
                                ? airingInfo.ticketPrice + (airingInfo.vipSeatUpCharge ?? 0)
                                : airingInfo.ticketPrice,
                        airingInfo: airingInfo,
                      )
                      : Padding(padding: const EdgeInsets.symmetric(vertical: 8.0)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TheaterRow extends StatelessWidget {
  final bool isVip;
  final int price;
  final double seatCount;
  final int startingSeatIndex;
  final String isleID;
  final MovieAiringInfo airingInfo;
  const TheaterRow({
    super.key,
    required this.seatCount,
    required this.startingSeatIndex,
    required this.isleID,
    required this.isVip,
    required this.price,
    required this.airingInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: isVip ? const Color.fromARGB(255, 56, 3, 3) : const Color.fromARGB(255, 56, 3, 3),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: isVip ? const Color.fromARGB(255, 87, 3, 3) : Colors.black,
              spreadRadius: 2,
              offset: isVip ? Offset(0, 3) : Offset(0, 2),
              blurRadius: isVip ? 6 : 1,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          spacing: seatGap,
          children: [
            for (int i = 0; i < seatCount; i++)
              SeatWidget(
                airingInfo: airingInfo,
                seatData: SeatData(seatNo: startingSeatIndex + i + 1, isleID: isleID, isVip: isVip, price: price),
              ),
          ],
        ),
      ),
    );
  }
}

class SeatWidget extends ConsumerStatefulWidget {
  const SeatWidget({super.key, required this.seatData, required this.airingInfo});
  final SeatData seatData;
  final MovieAiringInfo airingInfo;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SeatState();
}

class _SeatState extends ConsumerState<SeatWidget> {
  @override
  Widget build(BuildContext context) {
    final reservedSeat = ref.watch(seatStatusProvider(widget.airingInfo.screeningId));

    BoxDecoration getBoxDecoration() {
      Color color = Colors.red;
      if (reservedSeat.hasValue) {
        reservedSeat.value!.firstWhereOrNull((SeatStatusData data) {
          if (data.seatNumber == widget.seatData.seatNo && data.isleCode == widget.seatData.isleID) {
            if (data.booked) {
              color = Color.fromARGB(255, 45, 0, 0);
            } else {
              color = Color.fromARGB(255, 101, 12, 12);
            }
            return true;
          }
          return false;
        });
      }
      return BoxDecoration(borderRadius: BorderRadius.circular(4), color: color);
    }

    return SizedBox.square(
      dimension: seatSize,
      child: InkWell(
        onTap: () {
          ref
              .read(seatStatusProvider(widget.airingInfo.screeningId).notifier)
              .toggleReserveSeat(widget.airingInfo.screeningId, widget.seatData);
          ref.read(countdownProvider.notifier).startTimer();
        },
        child: DecoratedBox(
          decoration: getBoxDecoration(),
          child: Center(
            child: Text(
              "${widget.seatData.seatNo}${widget.seatData.isleID}",
              style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ),
    );
  }
}

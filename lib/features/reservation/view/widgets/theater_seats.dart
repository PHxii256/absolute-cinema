import 'package:flutter/material.dart';
import 'package:flutter_application/features/reservation/model/theater_model.dart';
import 'package:flutter_application/features/reservation/viewmodel/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const double seatSize = 34;
const double seatGap = 8;
const double isleGap = 14;

class TheaterSeatsViewer extends ConsumerWidget {
  final TheaterSeatingData theaterSeatingData;
  const TheaterSeatsViewer({super.key, required, required this.theaterSeatingData});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const double initialScrollOffset = 59; //magic number to center the view (requires change if no seats change)
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
          child: SingleChildScrollView(
            controller: ScrollController(initialScrollOffset: initialScrollOffset),
            scrollDirection: Axis.horizontal,
            child: SizedBox(
              height: 600,
              child: Row(
                spacing: isleGap,
                children: [
                  for (int i = 0; i < theaterSeatingData.seatingData.length; i++)
                    Isle(
                      isleData: theaterSeatingData.seatingData[i],
                      seatPrice: theaterSeatingData.seatPrice,
                      vipSeatPrice: theaterSeatingData.vipSeatPrice ?? theaterSeatingData.seatPrice,
                    ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Isle extends StatelessWidget {
  final IsleData isleData;
  final int seatPrice;
  final int vipSeatPrice;
  const Isle({super.key, required this.isleData, required this.seatPrice, required this.vipSeatPrice});

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
  Widget build(BuildContext context) {
    return SizedBox(
      width: isleData.seatCount * (seatSize + seatGap) + seatGap,
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
                for (int i = 0; i < isleData.rowsCount; i++)
                  !isGapRow(i)
                      ? TheaterRow(
                        seatCount: isleData.seatCount,
                        startingSeatIndex: i * isleData.seatCount.toInt(),
                        isleID: isleData.isleID,
                        isVip: isVipRow(i),
                        price: isVipRow(i) ? vipSeatPrice : seatPrice,
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
  //TO:DO : Add this to models
  final bool isVip;
  final int price;
  final double seatCount;
  final int startingSeatIndex;
  final String isleID;
  const TheaterRow({
    super.key,
    required this.seatCount,
    required this.startingSeatIndex,
    required this.isleID,
    required this.isVip,
    required this.price,
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
                seatData: SeatData(seatNo: startingSeatIndex + i + 1, isleID: isleID, isVip: isVip, price: price),
              ),
          ],
        ),
      ),
    );
  }
}

class SeatWidget extends ConsumerStatefulWidget {
  const SeatWidget({super.key, required this.seatData});
  final SeatData seatData;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SeatState();
}

class _SeatState extends ConsumerState<SeatWidget> {
  bool reserved = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: seatSize,
      child: InkWell(
        onTap: () {
          ref.read(reservedSeatsProvider.notifier).update((prev) {
            if (reserved == false) {
              return [...prev, widget.seatData];
            } else {
              prev.remove(widget.seatData);
              return prev = [...prev];
            }
          });
          setState(() {
            reserved = !reserved;
          });
        },
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: reserved ? const Color.fromARGB(255, 101, 12, 12) : Colors.red,
          ),
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

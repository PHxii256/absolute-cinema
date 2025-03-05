import 'package:flutter_application/features/reservation/model/theater_model.dart';

final TheaterSeatingData data = TheaterSeatingData(
  seatingData: [
    IsleData(seatCount: 3, rowsCount: 12, isleID: "A", vipRowIndexes: [0], gapRowIndexes: [3]),
    IsleData(seatCount: 5, rowsCount: 12, isleID: "B", vipRowIndexes: [0], gapRowIndexes: [3]),
    IsleData(seatCount: 3, rowsCount: 12, isleID: "C", vipRowIndexes: [0], gapRowIndexes: [3]),
  ],
  seatPrice: 90,
  vipSeatPrice: 150,
);

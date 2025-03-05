class TheaterSeatingData {
  final List<IsleData> seatingData;
  final int seatPrice;
  final int? vipSeatPrice;
  TheaterSeatingData({required this.seatingData, required this.seatPrice, this.vipSeatPrice});
}

class IsleData {
  final double seatCount; //how many seats per row
  final double rowsCount; //how many rows
  final List<int>? vipRowIndexes;
  final List<int>? gapRowIndexes;
  final String isleID;

  IsleData({
    required this.seatCount,
    required this.rowsCount,
    this.vipRowIndexes,
    this.gapRowIndexes,
    required this.isleID,
  });
}

class SeatData {
  final String isleID;
  final int seatNo;
  final bool isVip;
  final int price;

  SeatData({required this.isleID, required this.seatNo, required this.isVip, required this.price});
}

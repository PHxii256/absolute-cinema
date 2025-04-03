import 'package:freezed_annotation/freezed_annotation.dart';
part 'seat_status_data.freezed.dart';
part 'seat_status_data.g.dart';

@freezed
abstract class SeatStatusData with _$SeatStatusData {
  const factory SeatStatusData({
    @JsonKey(name: 'reserved_at') required DateTime reservedAt,
    @JsonKey(name: 'screening_id') required int screeningId,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'isle_code') required String isleCode,
    @JsonKey(name: 'seat_no') required int seatNumber,
    @JsonKey(name: 'is_vip') required bool isVip,
    required bool booked,
    required int price,
  }) = _SeatStatusData;

  factory SeatStatusData.fromJson(Map<String, Object?> json) => _$SeatStatusDataFromJson(json);
}

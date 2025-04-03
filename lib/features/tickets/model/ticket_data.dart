import 'package:freezed_annotation/freezed_annotation.dart';
part 'ticket_data.freezed.dart';
part 'ticket_data.g.dart';

@freezed
abstract class TicketData with _$TicketData {
  const factory TicketData({
    @JsonKey(name: 'ticket_qr_id') required String qrId,
    @JsonKey(name: 'ticket_pin_code') required int pinCode,
    @JsonKey(name: 'theater_name') required String theaterName,
    @JsonKey(name: 'movie_name') required String movieName,
    @JsonKey(name: 'hall_name') required String hallName,
    @JsonKey(name: 'movie_airing_time') required DateTime airingTimestamp,
    @JsonKey(name: 'movie_screening_id') required int screeningId,
    @JsonKey(name: 'isle_code') required String isleCode,
    @JsonKey(name: 'seat_no') required int seatNumber,
    @JsonKey(name: 'seat_price') required int seatPrice,
  }) = _TicketData;

  factory TicketData.fromJson(Map<String, Object?> json) => _$TicketDataFromJson(json);
}

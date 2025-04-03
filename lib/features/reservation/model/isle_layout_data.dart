import 'package:freezed_annotation/freezed_annotation.dart';
part 'isle_layout_data.freezed.dart';
part 'isle_layout_data.g.dart';

@freezed
abstract class IsleLayoutData with _$IsleLayoutData {
  const factory IsleLayoutData({
    @JsonKey(name: 'theater_id') required int theaterId,
    @JsonKey(name: 'hall_id') required int hallId,
    @JsonKey(name: 'row_seat_count') required int rowSeatCount,
    @JsonKey(name: 'row_count') required int rowCount,
    @JsonKey(name: 'vip_row_indexes') required List<int>? vipRowIndexes,
    @JsonKey(name: 'gap_row_indexes') required List<int>? gapRowIndexes,
    @JsonKey(name: 'isle_code') required String isleCode,
  }) = _IsleLayoutData;

  factory IsleLayoutData.fromJson(Map<String, Object?> json) => _$IsleLayoutDataFromJson(json);
}

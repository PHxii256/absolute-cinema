import 'package:flutter_application/features/reservation/model/isle_layout_data.dart';
import 'package:flutter_application/features/search/model/movie_airing_info.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
part 'seat_layout_notifier.g.dart';

@riverpod
class SeatLayout extends _$SeatLayout {
  @override
  Future<List<IsleLayoutData>> build(MovieAiringInfo airingInfo) async {
    return _getLayoutResults(airingInfo.theaterId, airingInfo.hallId);
  }

  Future<List<IsleLayoutData>> _getLayoutResults(int theaterId, int hallId) async {
    List<IsleLayoutData> isleLayouts = [];
    List<Map<String, dynamic>> dbResultList = await Supabase.instance.client
        .from('isle')
        .select()
        .eq('theater_id', theaterId)
        .eq('hall_id', hallId)
        .order('isle_code', ascending: true);
    for (var result in dbResultList) {
      IsleLayoutData isle = IsleLayoutData.fromJson(result);
      isleLayouts.add(isle);
    }
    return isleLayouts;
  }
}

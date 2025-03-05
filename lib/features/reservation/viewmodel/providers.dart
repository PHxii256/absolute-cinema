import 'package:flutter_application/features/reservation/model/theater_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final reservedSeatsProvider = StateProvider.autoDispose<List<SeatData>>((ref) => []);

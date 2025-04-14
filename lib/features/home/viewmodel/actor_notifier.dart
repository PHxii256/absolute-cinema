import 'dart:developer';

import 'package:flutter_application/features/home/models/actor_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
part 'actor_notifier.g.dart';

@riverpod
class ActorNotifier extends _$ActorNotifier {
  @override
  Future<List<ActorData>> build(int movieId) async {
    return getMovieActors(movieId);
  }

  Future<List<ActorData>> getMovieActors(int movieId) async {
    final List<ActorData> actorList = [];

    List<Map<String, dynamic>> dbResultList = await Supabase.instance.client
        .from('movie_actor')
        .select('actor_role, actor(*)')
        .eq('movie_id', movieId);

    try {
      for (var result in dbResultList) {
        ActorData movie = ActorData.fromJson(result);
        actorList.add(movie);
      }
    } catch (e) {
      log(e.toString());
    }

    return actorList;
  }
}

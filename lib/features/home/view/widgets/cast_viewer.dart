import 'package:flutter/material.dart';
import 'package:flutter_application/features/home/view/widgets/cast_avatar.dart';
import 'package:flutter_application/features/home/viewmodel/actor_notifier.dart';
import 'package:flutter_application/features/search/model/movie_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CastViewer extends ConsumerWidget {
  final MovieData movieData;
  const CastViewer({super.key, required this.movieData});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final actorList = ref.watch(actorNotifierProvider(movieData.id));

    List<Widget> getActorWidgets() {
      final List<Widget> widgetList = [];
      if (actorList.hasValue) {
        for (var actor in actorList.value!) {
          widgetList.add(CastAvatar(name: actor.name, role: actor.role));
        }
      } else if (actorList.hasError) {
        widgetList.add(Padding(padding: const EdgeInsets.only(top: 16), child: Text("Error Loading Actors")));
      }
      return widgetList;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Cast", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 6),
        SizedBox(
          height: 90,
          child: ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: [CastAvatar(name: movieData.director ?? "Bombardero", role: "Director"), ...getActorWidgets()],
          ),
        ),
      ],
    );
  }
}

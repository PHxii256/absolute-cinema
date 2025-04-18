import 'package:flutter/material.dart';
import 'package:flutter_application/features/home/models/filters/theater/allow_snacks_filter.dart';
import 'package:flutter_application/features/home/view/widgets/filters/filter_viewer.dart';
import 'package:flutter_application/features/home/view/widgets/filters/theater_filter_picker.dart';
import 'package:flutter_application/features/home/view/widgets/sort_options.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';

class DetailsPageFab extends StatefulWidget {
  final int movieId;
  const DetailsPageFab({super.key, required this.movieId});

  @override
  State<DetailsPageFab> createState() => _DetailsPageFabState();
}

class _DetailsPageFabState extends State<DetailsPageFab> {
  final _key = GlobalKey<ExpandableFabState>();
  double blur = 5;

  @override
  void initState() {
    blur = 0;
    super.initState();
  }

  double getBlur() {
    blur = 5;
    return blur;
  }

  void onPressHandler() {
    final state = _key.currentState;
    if (state != null) {
      state.toggle();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ExpandableFab(
      onClose: () => blur = 0,
      type: ExpandableFabType.up,
      key: _key,
      childrenAnimation: ExpandableFabAnimation.none,
      distance: 70, //cation: setting blur crashes the app wih the impeller renderer
      overlayStyle: ExpandableFabOverlayStyle(color: Colors.white38, blur: getBlur()),
      children: [
        Row(
          children: [
            Text(
              'Sort',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Theme.of(context).colorScheme.inverseSurface,
              ),
            ),
            SizedBox(width: 10),
            FloatingActionButton.small(
              heroTag: null,
              onPressed: () {
                onPressHandler();
                showModalBottomSheet(
                  showDragHandle: true,
                  barrierColor: const Color.fromARGB(190, 0, 0, 0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(6), topRight: Radius.circular(6)),
                  ),
                  context: context,
                  builder: (context) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.25,
                      width: double.infinity,
                      child: SortOptions(movieId: widget.movieId),
                    );
                  },
                );
              },
              child: Icon(Icons.sort),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              'Filter',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Theme.of(context).colorScheme.inverseSurface,
              ),
            ),
            SizedBox(width: 10),
            FloatingActionButton.small(
              heroTag: null,
              onPressed: () {
                onPressHandler();
                showModalBottomSheet(
                  showDragHandle: true,
                  barrierColor: const Color.fromARGB(190, 0, 0, 0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(6), topRight: Radius.circular(6)),
                  ),
                  context: context,
                  builder: (context) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.25,
                      width: double.infinity,
                      child: FiltersViewer(
                        filterMap: {"Allows Outside Snacks": TheaterFilterPicker(filter: AllowSnacksFilter())},
                      ),
                    );
                  },
                );
              },
              child: Icon(Icons.filter_alt),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              'Reminder',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Theme.of(context).colorScheme.inverseSurface,
              ),
            ),
            SizedBox(width: 10),
            FloatingActionButton.small(heroTag: null, onPressed: onPressHandler, child: Icon(Icons.notification_add)),
          ],
        ),
      ],
    );
  }
}

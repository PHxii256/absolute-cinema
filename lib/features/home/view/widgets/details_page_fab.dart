import 'package:flutter/material.dart';
import 'package:flutter_application/features/home/models/filters/theater/allow_snacks_filter.dart';
import 'package:flutter_application/features/home/models/filters/theater/area_filter.dart';
import 'package:flutter_application/features/home/models/filters/theater/governorate_filter.dart';
import 'package:flutter_application/features/home/view/widgets/filters/filter_viewer.dart';
import 'package:flutter_application/features/home/view/widgets/filters/theater_filter_picker.dart';
import 'package:flutter_application/features/home/view/widgets/theater_sort_options.dart';
import 'package:flutter_application/features/search/viewmodel/theater_search_notifier.dart';
import 'package:flutter_application/services/notificaton_service.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailsPageFab extends ConsumerStatefulWidget {
  final int movieId;
  final String movieName;
  final DateTime movieReleaseDate;
  const DetailsPageFab({super.key, required this.movieId, required this.movieName, required this.movieReleaseDate});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DetailsPageFabState();
}

class _DetailsPageFabState extends ConsumerState<DetailsPageFab> {
  final _key = GlobalKey<ExpandableFabState>();
  double blur = 5;
  bool reminderSet = false;

  @override
  void initState() {
    blur = 0;
    checkReminderSet();
    super.initState();
  }

  void checkReminderSet() async {
    final isSet = await NotificationService().checkNotficationReminderSet(widget.movieId);
    setState(() {
      reminderSet = isSet;
    });
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

  void filterButtonOnPress() {
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
            filterMap: {
              "Allows Outside Snacks": TheaterFilterPicker(filter: AllowSnacksFilter()),
              "Governorate": TheaterFilterPicker(filter: GovernorateFilter(getGovernorates())),
              "Area": TheaterFilterPicker(filter: AreaFilter(getArea())),
            },
          ),
        );
      },
    );
  }

  void sortButtonOnPressed() {
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
          child: TheaterSortOptions(movieId: widget.movieId),
        );
      },
    );
  }

  bool isReleased() => widget.movieReleaseDate.isBefore(DateTime.now());

  void reminderButtonPressed() {
    onPressHandler();
    if (isReleased()) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Reminder not set, This Movie is already released")));
      }
      return;
    }

    if (reminderSet == true) {
      NotificationService().cancelNotification(widget.movieId);
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Succesfully Cleared Reminder For ${widget.movieName}'s Release")));
      }
    } else {
      NotificationService().scheduleNotification(
        id: widget.movieId,
        title: "Psss... Hey ${widget.movieName} just got released",
        body: "Open the app to book your seat :D",
        minutesTillNotif: widget.movieReleaseDate.difference(DateTime.now()).inMinutes,
      );

      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Succesfully Set Reminder For ${widget.movieName}'s Release")));
      }
    }

    setState(() {
      reminderSet = !reminderSet;
    });
  }

  Set<String> getGovernorates() {
    return ref.read(TheaterSearchProvider(movieId: widget.movieId).notifier).getGovernorates();
  }

  Set<String> getArea() {
    return ref.read(TheaterSearchProvider(movieId: widget.movieId).notifier).getAreas();
  }

  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(TheaterSearchProvider(movieId: widget.movieId));
    bool resultsEmpty = true;
    provider.when(
      data: (d) {
        return setState(() {
          resultsEmpty = d.isEmpty;
        });
      },
      error: (_, _) {},
      loading: () {},
    );

    return ExpandableFab(
      onClose: () => blur = 0,
      type: ExpandableFabType.up,
      key: _key,
      childrenAnimation: ExpandableFabAnimation.none,
      distance: 70, //cation (overlayStyle): setting blur crashes the app wih the impeller renderer
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
              disabledElevation: 0,
              backgroundColor: resultsEmpty ? Theme.of(context).disabledColor : null,
              foregroundColor: resultsEmpty ? Theme.of(context).colorScheme.onSurface : null,
              onPressed: resultsEmpty ? null : sortButtonOnPressed,
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
              disabledElevation: 0,
              backgroundColor: resultsEmpty ? Theme.of(context).disabledColor : null,
              foregroundColor: resultsEmpty ? Theme.of(context).colorScheme.onSurface : null,
              onPressed: resultsEmpty ? null : filterButtonOnPress,
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
            FloatingActionButton.small(
              heroTag: null,
              onPressed: reminderButtonPressed,
              child: !reminderSet ? Icon(Icons.notification_add) : Icon(Icons.notifications_off_rounded),
            ),
          ],
        ),
      ],
    );
  }
}

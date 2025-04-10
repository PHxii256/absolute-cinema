import 'package:flutter/material.dart';
import 'package:flutter_application/features/home/view/viewmodel/movie_filter_notifer.dart';
import 'package:flutter_application/features/home/view/widgets/home.dart';
import 'package:flutter_application/features/settings/view/pages/settings_page.dart';
import 'package:flutter_application/features/tickets/view/pages/tickets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  int currentSelectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 246, 205, 241),
        title: Center(child: Text(widget.title, style: TextStyle(fontWeight: FontWeight.bold))),
      ),
      body: [MyTickets(), NowAiring(), SettingsPage()][currentSelectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentSelectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            if (currentSelectedIndex != index) {
              ref.read(movieFiltersProvider.notifier).resetFilters();
              currentSelectedIndex = index;
            }
          });
        },
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        destinations: [
          // NavigationDestination(icon: Icon(Icons.search), label: "Search"),
          NavigationDestination(icon: Icon(Icons.local_movies), label: "Tickets"),
          NavigationDestination(icon: Icon(Icons.home), label: "Home"),
          NavigationDestination(icon: Icon(Icons.settings), label: "Settings"),
        ],
      ),
    );
  }
}

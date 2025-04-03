import 'package:flutter/material.dart';
import 'package:flutter_application/features/home/view/widgets/now_airing.dart';
import 'package:flutter_application/features/search/view/pages/search_page.dart';
import 'package:flutter_application/features/settings/view/pages/settings_page.dart';
import 'package:flutter_application/features/tickets/view/pages/tickets.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentSelectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 246, 205, 241),
        title: Center(child: Text(widget.title, style: TextStyle(fontWeight: FontWeight.bold))),
      ),
      body: [NowAiring(), SearchPage(), MyTickets(), SettingsPage()][currentSelectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentSelectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            currentSelectedIndex = index;
          });
        },
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        destinations: [
          NavigationDestination(icon: Icon(Icons.home), label: "Home"),
          NavigationDestination(icon: Icon(Icons.search), label: "Search"),
          NavigationDestination(icon: Icon(Icons.local_movies), label: "Tickets"),
          NavigationDestination(icon: Icon(Icons.settings), label: "Settings"),
        ],
      ),
    );
  }
}

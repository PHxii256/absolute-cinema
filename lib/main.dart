import 'package:flutter/material.dart';
import 'package:flutter_application/features/search/view/pages/search_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Absolute Cinema',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 195, 103, 176))),
      home: const MyHomePage(title: 'Absolute Cinema'),
    );
  }
}

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
      body: [NowAiring(), SearchPage(), Placeholder()][currentSelectedIndex],
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
          NavigationDestination(icon: Icon(Icons.settings), label: "Settings"),
        ],
      ),
    );
  }
}

class NowAiring extends StatelessWidget {
  const NowAiring({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[const Text('Now Airing')]),
    );
  }
}

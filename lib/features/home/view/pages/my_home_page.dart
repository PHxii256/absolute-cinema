import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/features/home/viewmodel/movie_filter_notifer.dart';
import 'package:flutter_application/features/home/view/widgets/home.dart';
import 'package:flutter_application/features/settings/view/pages/settings_page.dart';
import 'package:flutter_application/features/tickets/view/pages/tickets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  int currentSelectedIndex = 1;

  @override
  void initState() {
    Supabase.instance.client.auth.onAuthStateChange.listen((event) async {
      if (event.event == AuthChangeEvent.signedIn) {
        await FirebaseMessaging.instance.requestPermission();
        final fcmToken = await FirebaseMessaging.instance.getToken();
        if (fcmToken != null) {
          setFcmToken(fcmToken);
        } else {
          log("fcm token null");
        }
      }
    });

    FirebaseMessaging.instance.onTokenRefresh.listen((fcmToken) {
      setFcmToken(fcmToken);
    });

    FirebaseMessaging.onMessage.listen((payload) {
      if (payload.notification != null) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: Duration(minutes: 10),
              content: Text('${payload.notification!.title} ${payload.notification!.body}'),
            ),
          );
          log(payload.notification!.body.toString());
        }
      }
    });

    super.initState();
  }

  void setFcmToken(String fcmToken) async {
    await Supabase.instance.client.from('profile').upsert({
      'id': Supabase.instance.client.auth.currentUser!.id,
      'fcm_token': fcmToken,
    });
  }

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
          NavigationDestination(icon: Icon(Icons.local_movies), label: "Tickets"),
          NavigationDestination(icon: Icon(Icons.home), label: "Home"),
          NavigationDestination(icon: Icon(Icons.settings), label: "Settings"),
        ],
      ),
    );
  }
}

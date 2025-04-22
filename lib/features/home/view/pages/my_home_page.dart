import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/features/home/view/widgets/home_page_drawer.dart';
import 'package:flutter_application/features/home/viewmodel/movie_filter_notifer.dart';
import 'package:flutter_application/features/home/view/widgets/home.dart';
import 'package:flutter_application/features/settings/view/pages/settings_page.dart';
import 'package:flutter_application/features/tickets/view/pages/tickets.dart';
import 'package:flutter_application/features/vouchers/view/pages/voucher_page.dart';
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
    setUpFCM();
    super.initState();
  }

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () async {
            _scaffoldKey.currentState!.openDrawer();
          },
          icon: Icon(Icons.menu),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsPage()));
            },
            icon: Icon(Icons.settings_outlined),
          ),
        ],
        title: Text(widget.title, style: TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
      ),
      body: [MyTickets(), NowAiring(), VoucherPage()][currentSelectedIndex],
      bottomNavigationBar: NavigationBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
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
          NavigationDestination(icon: Icon(Icons.attach_money_outlined), label: "Vouchers"),
        ],
      ),
      drawer: HomePageDrawer(),
    );
  }

  void setUpFCM() {
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
  }

  void setFcmToken(String fcmToken) async {
    await Supabase.instance.client.from('profile').upsert({
      'id': Supabase.instance.client.auth.currentUser!.id,
      'fcm_token': fcmToken,
    });
  }
}

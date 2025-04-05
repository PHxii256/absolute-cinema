import 'package:flutter/material.dart';
import 'package:flutter_application/features/authentication/services/auth_gate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: "https://bvquxsswjrznbrlcxrkk.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJ2cXV4c3N3anJ6bmJybGN4cmtrIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDE0MzM3NTgsImV4cCI6MjA1NzAwOTc1OH0.CR1jQiuBpVVjcYJZOkAH-0qxbx51mqe1jrtOCezZIpQ",
  );
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Absolute Cinema',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 195, 103, 176))),
      home: AuthGate(),
    );
  }
}

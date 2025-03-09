//Listens to Auth State Changes And Routes User to Appropriate page

import 'package:flutter/material.dart';
import 'package:flutter_application/features/home/view/pages/my_home_page.dart';
import 'package:flutter_application/features/authentication/view/pages/login_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      //listens to auth state changes
      stream: Supabase.instance.client.auth.onAuthStateChange,
      //builds the correct page for the current auth state
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          CircularProgressIndicator();
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(body: Center(child: CircularProgressIndicator()));
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          CircularProgressIndicator();
        }
        final session = snapshot.hasData ? snapshot.data!.session : null;
        if (session != null) {
          return MyHomePage(title: "Absolute Cinema");
        } else {
          return LoginPage();
        }
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application/features/authentication/services/auth_service.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = AuthService();

    return Padding(
      padding: EdgeInsets.all(8),
      child: TextButton.icon(
        onPressed: () {
          authService.signOut();
        },
        label: Text('Logout', style: TextStyle(fontSize: 18)),
        icon: Icon(Icons.logout, size: 18),
        iconAlignment: IconAlignment.end,
      ),
    );
  }
}

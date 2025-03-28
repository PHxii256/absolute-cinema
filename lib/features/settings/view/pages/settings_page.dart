import 'package:flutter/material.dart';
import 'package:flutter_application/features/authentication/services/auth_service.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final authService = AuthService();
  int balance = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton.icon(
            onPressed: () {
              authService.signOut();
            },
            label: Text('Logout', style: TextStyle(fontSize: 18)),
            icon: Icon(Icons.logout, size: 18),
            iconAlignment: IconAlignment.end,
          ),
          TextButton.icon(
            onPressed: () {},
            label: Text('Delete Personal Data', style: TextStyle(fontSize: 18)),
            icon: Icon(Icons.delete_outlined, size: 18),
            iconAlignment: IconAlignment.end,
          ),
          TextButton.icon(
            onPressed: () {
              setState(() {
                balance += 50;
              });
            },
            label: Text('Add 50 EGP To Balance', style: TextStyle(fontSize: 18)),
            icon: Icon(Icons.attach_money, size: 18),
            iconAlignment: IconAlignment.end,
          ),
          TextButton.icon(
            onPressed: () {
              setState(() {
                if (balance - 50 >= 0) {
                  balance -= 50;
                }
              });
            },
            label: Text('Remove 50 EGP From Balance', style: TextStyle(fontSize: 18)),
            icon: Icon(Icons.money_off, size: 18),
            iconAlignment: IconAlignment.end,
          ),
          TextButton.icon(
            onPressed: () {
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    behavior: SnackBarBehavior.floating,
                    duration: Duration(milliseconds: 1000),
                    content: Text("Your Current Balance is $balance EGP"),
                  ),
                );
              }
            },
            label: Text('Show Balance', style: TextStyle(fontSize: 18)),
            icon: Icon(Icons.visibility_outlined, size: 18),
            iconAlignment: IconAlignment.end,
          ),
        ],
      ),
    );
  }
}

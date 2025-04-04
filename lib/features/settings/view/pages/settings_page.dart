import 'package:flutter/material.dart';
import 'package:flutter_application/features/authentication/services/auth_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  Future<int?> tryGetBalance() async {
    final response =
        await Supabase.instance.client
            .from('user_balance')
            .select('balance')
            .eq('user_id', Supabase.instance.client.auth.currentUser!.id)
            .maybeSingle();

    if (response != null) {
      return response["balance"] as int;
    }
    return null;
  }

  Future<Map<String, dynamic>> _createBalanceRecord() async {
    try {
      return await Supabase.instance.client
          .from('user_balance')
          .insert({'user_id': Supabase.instance.client.auth.currentUser!.id, 'balance': 0})
          .select()
          .single();
    } catch (e) {
      return {};
    }
  }

  Future<String?> updateBalance(int amount) async {
    int? currentBalance = await tryGetBalance();

    if (currentBalance == null) {
      try {
        await _createBalanceRecord();
        currentBalance = await tryGetBalance();
      } catch (e) {
        return e.toString();
      }
    } else {
      try {
        await Supabase.instance.client
            .from('user_balance')
            .update({'balance': currentBalance + amount})
            .eq('user_id', Supabase.instance.client.auth.currentUser!.id)
            .maybeSingle();
        return null;
      } catch (e) {
        return e.toString();
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authService = AuthService();

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
            onPressed: () async {
              SharedPreferences preferences = await SharedPreferences.getInstance();
              await preferences.clear();
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(behavior: SnackBarBehavior.floating, content: Text("Success! Deleted All Personal Data")),
                );
              }
            },
            label: Text('Delete Personal Data', style: TextStyle(fontSize: 18)),
            icon: Icon(Icons.delete_outlined, size: 18),
            iconAlignment: IconAlignment.end,
          ),
          TextButton.icon(
            onPressed: () async {
              final String? err = await updateBalance(50);
              final int? balance = await tryGetBalance();

              if (context.mounted) {
                if (err == null && balance != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration: Duration(milliseconds: 400),
                      behavior: SnackBarBehavior.floating,
                      content: Text("Success! Current Balance is ${balance.toString()}EGP"),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(behavior: SnackBarBehavior.floating, content: Text("Error: $err")));
                }
              }
            },
            label: Text('Add 50 EGP To Balance', style: TextStyle(fontSize: 18)),
            icon: Icon(Icons.attach_money, size: 18),
            iconAlignment: IconAlignment.end,
          ),
          TextButton.icon(
            onPressed: () async {
              final String? err = await updateBalance(-50);
              final int? balance = await tryGetBalance();

              if (context.mounted) {
                if (err == null && balance != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration: Duration(milliseconds: 400),
                      behavior: SnackBarBehavior.floating,
                      content: Text("Success! Current Balance is ${balance.toString()}EGP"),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(behavior: SnackBarBehavior.floating, content: Text("Error: $err")));
                }
              }
            },
            label: Text('Remove 50 EGP From Balance', style: TextStyle(fontSize: 18)),
            icon: Icon(Icons.money_off, size: 18),
            iconAlignment: IconAlignment.end,
          ),
          TextButton.icon(
            onPressed: () async {
              final int? balance = await tryGetBalance();

              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    behavior: SnackBarBehavior.floating,
                    duration: Duration(milliseconds: 400),
                    content:
                        balance != null
                            ? Text("Success! Current Balance is ${balance.toString()}EGP")
                            : Text("Error getting the balance :/"),
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

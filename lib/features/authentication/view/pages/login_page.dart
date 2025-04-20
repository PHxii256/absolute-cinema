import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_application/features/authentication/view/pages/sign_up_page.dart';
import 'package:flutter_application/features/authentication/services/auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final authService = AuthService();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void login() async {
    final email = emailController.text;
    final password = passwordController.text;

    await authService
        .signInWithEmailPassword(email, password)
        .then(
          (res) {
            if (mounted) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(behavior: SnackBarBehavior.floating, content: Text("Successfuly Loged In")));
            }
          },
          onError: (e) {
            if (mounted) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(behavior: SnackBarBehavior.floating, content: Text("Error: $e")));
            }
          },
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Welcome back!", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26)),
              Text(
                "Please Login To Continue",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.grey),
              ),
              SizedBox(height: 8),
              TextField(controller: emailController, decoration: InputDecoration(label: Text("Email"))),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(label: Text("Password")),
                obscureText: true,
              ),
              SizedBox(height: 20),
              ElevatedButton(onPressed: login, child: Text("Login")),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SignUpPage()));
                },
                child: Text("Don't Have An Account? Sign Up"),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(child: Divider()),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Text(
                        "or use social sign-in",
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ),
                    Expanded(child: Divider()),
                  ],
                ),
              ),
              SizedBox(height: 4),
              InkWell(
                onTap: () async {
                  try {
                    await AuthService().googleSignIn();
                  } catch (e) {
                    log(e.toString());
                  }
                },
                child: Ink(child: SizedBox(height: 40, child: Image.asset('assets/google_rectangle.png'))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

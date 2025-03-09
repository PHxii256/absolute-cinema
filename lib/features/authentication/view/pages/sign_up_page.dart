import 'package:flutter/material.dart';
import 'package:flutter_application/features/authentication/services/auth_service.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPage();
}

class _SignUpPage extends State<SignUpPage> {
  final authService = AuthService();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void login() async {
    final email = emailController.text;
    final password = passwordController.text;
    final confirmPassword = confirmPasswordController.text;

    if (password != confirmPassword) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(behavior: SnackBarBehavior.floating, content: Text("Passwords Don't match")));
      return;
    }

    await authService
        .signUpWithEmailPassword(email, password)
        .then(
          (res) {
            authService.signInWithEmailPassword(email, password);
            if (mounted) {
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(behavior: SnackBarBehavior.floating, content: Text("Successfuly Created Account, Welcome!")),
              );
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
      appBar: AppBar(title: Text("Sign Up", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26))),
      body: ListView(
        padding: EdgeInsets.all(24),
        children: [
          TextField(controller: emailController, decoration: InputDecoration(label: Text("Email"))),
          TextField(
            controller: passwordController,
            decoration: InputDecoration(label: Text("Password")),
            obscureText: true,
          ),
          TextField(
            controller: confirmPasswordController,
            decoration: InputDecoration(label: Text("Confirm Password")),
            obscureText: true,
          ),
          SizedBox(height: 30),
          ElevatedButton(onPressed: login, child: Text("Signup")),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Already Have An Account? Login"),
          ),
        ],
      ),
    );
  }
}

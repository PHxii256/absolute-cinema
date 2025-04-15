import 'package:flutter/material.dart';

class CastAvatar extends StatelessWidget {
  final String name;
  final String role;
  const CastAvatar({super.key, required this.name, required this.role});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Column(
        children: [
          CircleAvatar(radius: 24, child: Icon(Icons.person)),
          SizedBox(height: 4),
          Text(name, style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
          Text(role, style: TextStyle(fontSize: 11)),
        ],
      ),
    );
  }
}

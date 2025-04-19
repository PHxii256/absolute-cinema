import 'package:flutter/material.dart';

class CastAvatar extends StatelessWidget {
  final String name;
  final String role;
  const CastAvatar({super.key, required this.name, required this.role});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 100),
        child: Column(
          children: [
            CircleAvatar(radius: 24, child: Icon(Icons.person)),
            SizedBox(height: 4),
            Text(
              textWidthBasis: TextWidthBasis.longestLine,
              name,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, height: 1),
            ),
            SizedBox(height: 4),
            Text(
              role,
              textAlign: TextAlign.center,
              textWidthBasis: TextWidthBasis.longestLine,
              style: TextStyle(fontSize: 13, fontStyle: FontStyle.italic, height: 1),
            ),
          ],
        ),
      ),
    );
  }
}

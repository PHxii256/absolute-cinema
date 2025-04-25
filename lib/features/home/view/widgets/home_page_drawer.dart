import 'package:flutter/material.dart';

class HomePageDrawer extends StatelessWidget {
  const HomePageDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: Border.all(width: 0),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 100,
            child: DrawerHeader(
              padding: EdgeInsets.fromLTRB(16, 8, 16, 22),
              decoration: BoxDecoration(color: Theme.of(context).colorScheme.surfaceContainer),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                spacing: 8,
                children: [
                  Text(
                    'Absolute Cinema',
                    style: TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, fontSize: 22),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: Text(
                      'v1.0',
                      style: TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            dense: true,
            minLeadingWidth: 0,
            leading: SizedBox(width: 16, child: Icon(Icons.favorite_outline)),
            title: const Text(
              'Rate Us',
              style: TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, fontSize: 18),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            dense: true,
            minLeadingWidth: 0,
            leading: SizedBox(width: 16, child: Icon(Icons.group_add_outlined)),
            title: const Text(
              'Invite Friends',
              style: TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, fontSize: 18),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            dense: true,
            minLeadingWidth: 0,
            leading: SizedBox(width: 16, child: Icon(Icons.contact_support_outlined)),
            title: const Text(
              'Help & Support',
              style: TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, fontSize: 18),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            dense: true,
            minLeadingWidth: 0,
            leading: SizedBox(width: 16, child: Icon(Icons.info_outline)),
            title: const Text(
              'About the app',
              style: TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, fontSize: 18),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

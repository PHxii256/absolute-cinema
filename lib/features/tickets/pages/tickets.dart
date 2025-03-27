import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyTickets extends ConsumerStatefulWidget {
  const MyTickets({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyTicketsState();
}

class _MyTicketsState extends ConsumerState<MyTickets> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("my tickets :)"));
  }
}

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application/features/tickets/model/ticket_data.dart';
import 'package:flutter_application/features/tickets/view/widgets/ticket_card.dart';
import 'package:flutter_application/features/tickets/viewmodel/ticket_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyTickets extends ConsumerWidget {
  const MyTickets({super.key});

  List<Widget> getCards(List<TicketData> ticketDataList) {
    List<Widget> cards = [];
    Map<int, List<TicketData>> screeningIdticketDataIndexes = {};
    for (var i = 0; i < ticketDataList.length; i++) {
      screeningIdticketDataIndexes.update(
        ticketDataList[i].screeningId,
        (value) => [...value, ticketDataList[i]],
        ifAbsent: () => [ticketDataList[i]],
      );
    }

    for (var entry in screeningIdticketDataIndexes.entries) {
      cards.add(TicketCard(tickeData: entry.value));
    }
    return cards;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tickets = ref.watch(ticketNotifierProvider);
    return switch (tickets) {
      AsyncData(:final value) =>
        value.isNotEmpty ? ListView(children: getCards(value)) : Center(child: Text("You dont have any tickets yet")),
      AsyncError() => const Text('Oops, something unexpected happened'),
      _ => Center(child: SizedBox(width: 40, height: 40, child: const CircularProgressIndicator())),
    };
  }
}

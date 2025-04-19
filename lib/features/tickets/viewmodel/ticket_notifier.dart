import 'package:flutter_application/features/tickets/model/ticket_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
part 'ticket_notifier.g.dart';

@riverpod
class TicketNotifier extends _$TicketNotifier {
  @override
  Future<List<TicketData>> build() async {
    return getTickets();
  }

  Future<List<TicketData>> getTickets() async {
    List<TicketData> ticketData = [];
    List<Map<String, dynamic>> dbResultList = await Supabase.instance.client.rpc(
      'get_tickets_info',
      params: {'p_user_id': Supabase.instance.client.auth.currentUser!.id},
    );
    for (var result in dbResultList) {
      TicketData ticket = TicketData.fromJson(result);
      if (!isDuplicateData(ticketData, ticket)) ticketData.add(ticket);
    }
    return ticketData;
  }

  bool isDuplicateData(List<TicketData> ticketData, TicketData current) {
    for (var t in ticketData) {
      if (t.screeningId == current.screeningId &&
          t.isleCode == current.isleCode &&
          t.seatNumber == current.seatNumber) {
        return true;
      }
    }
    return false;
  }
}

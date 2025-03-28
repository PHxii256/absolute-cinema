import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyTickets extends ConsumerStatefulWidget {
  const MyTickets({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyTicketsState();
}

class _MyTicketsState extends ConsumerState<MyTickets> {
  String ticketId = "";
  String ticketPIN = "";

  void copyToClipboard(String text) async {
    if (text.isNotEmpty) {
      try {
        await Clipboard.setData(ClipboardData(text: text));
        if (mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(duration: Duration(milliseconds: 600), content: Text('Copied to Clipboard!')));
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(duration: Duration(milliseconds: 600), content: Text('Failed to copy to clipboard.')),
          );
        }
      }
    }
  }

  void loadTicket() async {
    final prefs = await SharedPreferences.getInstance();
    String id = prefs.getString('ticketId') ?? "Invalid Id";
    setState(() {
      ticketId = id;
    });
  }

  void loadPIN() async {
    final prefs = await SharedPreferences.getInstance();
    String pin = prefs.getString('ticketPIN') ?? "Invalid PIN";
    setState(() {
      ticketPIN = pin;
    });
  }

  Future<bool> ticketIdExists() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('ticketId') == null ? false : true;
  }

  Future<bool> pinExists() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('pin') == null ? false : true;
  }

  void loadTicketId() async {
    loadTicket();
    loadPIN();
  }

  @override
  void initState() {
    loadTicketId();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          child: ListView(
            shrinkWrap: true,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(minHeight: 30),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 24, 12, 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Suzume", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      Row(
                        spacing: 8,
                        children: [
                          Text("Zawya Cinema", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          Text("Hall (1)", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Text("Seat(s): A12 , A13", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      Text("Starting Time: 7:30 PM", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
              Center(child: QrImageView(data: ticketId, version: QrVersions.auto, size: 320, gapless: true)),
              Center(
                child: InkWell(
                  onTap: () => copyToClipboard(ticketPIN),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 8,
                    children: [
                      Text("PIN: $ticketPIN", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                      Icon(Icons.copy_all, size: 18),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

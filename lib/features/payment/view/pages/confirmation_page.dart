import 'package:flutter/material.dart';
import 'package:flutter_application/features/home/view/pages/my_home_page.dart';
import 'package:flutter_application/features/tickets/pages/tickets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class PaymentConfirmation extends ConsumerStatefulWidget {
  const PaymentConfirmation({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PaymentConfirmationState();
}

class _PaymentConfirmationState extends ConsumerState<PaymentConfirmation> {
  String generateId() {
    var uuid = Uuid();
    return uuid.v4();
  }

  void saveTicketId(String id) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('ticketId', id);
    setState(() {
      ticketId = id;
    });
  }

  Future<bool> ticketIdExists() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('ticketId') == null ? false : true;
  }

  void loadTicketId() async {
    bool exists = await ticketIdExists();
    if (exists) {
    } else {
      saveTicketId(generateId());
    }
  }

  String ticketId = "";

  @override
  void initState() {
    loadTicketId();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil<void>(
              context,
              MaterialPageRoute<void>(builder: (BuildContext context) => const MyHomePage(title: 'Absolute Cinema')),
              ModalRoute.withName('/home'),
            );
          },
        ),
      ),
      body: Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Text("Thanks!")),
            QrImageView(data: ticketId, version: QrVersions.auto, size: 320, gapless: true),
          ],
        ),
      ),
    );
  }
}

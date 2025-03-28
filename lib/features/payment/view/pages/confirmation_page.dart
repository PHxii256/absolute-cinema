import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application/features/home/view/pages/my_home_page.dart';
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

  String generateId() {
    var uuid = Uuid();
    return uuid.v4();
  }

  String generatePIN() {
    Random random = Random();
    String s = random.nextInt(1000000).toString();
    String x = "${s.substring(0, 3)}-${s.substring(3, 6)}";
    return x;
  }

  void saveTicketId(String id) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('ticketId', id);
    setState(() {
      ticketId = id;
    });
  }

  void saveTicketPIN(String pin) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('ticketPIN', pin);
    setState(() {
      ticketPIN = pin;
    });
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

  void showSnackbar() {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(behavior: SnackBarBehavior.floating, content: Text("Successfuly Booked Tickets! Thank You :)")),
      );
    }
  }

  void loadTicketId() async {
    bool ticketExists = await ticketIdExists();

    if (ticketExists) {
      loadTicket();
      showSnackbar();
    } else {
      saveTicketId(generateId());
    }
    bool pinExist = await pinExists();
    if (pinExist) {
      loadPIN();
    } else {
      saveTicketPIN(generatePIN());
    }
  }

  String ticketId = "";
  String ticketPIN = "";

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
        title: Text("Thank You!"),
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              QrImageView(data: ticketId, version: QrVersions.auto, size: 320, gapless: true),
              InkWell(
                onTap: () => copyToClipboard(ticketPIN),
                child: Text("PIN: $ticketPIN", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

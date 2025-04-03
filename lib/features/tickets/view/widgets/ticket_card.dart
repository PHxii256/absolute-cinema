import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application/features/tickets/model/ticket_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart';

class TicketCard extends ConsumerWidget {
  final List<TicketData> tickeData;
  const TicketCard({super.key, required this.tickeData});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String getFormatedTime() {
      return DateFormat.jm().format(tickeData.first.airingTimestamp).toString();
    }

    String getFormatedSeats() {
      String seats = "";
      for (var data in tickeData) {
        seats += "${data.isleCode}${data.seatNumber} ";
      }
      return seats;
    }

    void copyToClipboard(String text) async {
      if (text.isNotEmpty) {
        try {
          await Clipboard.setData(ClipboardData(text: text));
          if (context.mounted) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(duration: Duration(milliseconds: 600), content: Text('Copied to Clipboard!')));
          }
        } catch (e) {
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(duration: Duration(milliseconds: 600), content: Text('Failed to copy to clipboard.')),
            );
          }
        }
      }
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 16, 8, 0),
        child: Card(
          child: Column(
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(minHeight: 30),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 24, 12, 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(tickeData.first.movieName, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      Row(
                        spacing: 8,
                        children: [
                          Text(
                            tickeData.first.theaterName,
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(tickeData.first.hallName, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Text(
                        "Seat(s): ${getFormatedSeats()}",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Starting Time: ${getFormatedTime()}",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                child: QrImageView(data: tickeData.first.qrId, version: QrVersions.auto, size: 320, gapless: true),
              ),
              Center(
                child: InkWell(
                  onTap: () => copyToClipboard(tickeData.first.pinCode.toString()),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 8,
                    children: [
                      Text(
                        "PIN: ${tickeData.first.pinCode.toString()}",
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      ),
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

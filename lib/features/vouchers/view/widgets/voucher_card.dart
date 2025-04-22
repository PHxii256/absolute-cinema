import 'package:flutter/material.dart';
import 'package:flutter_application/features/vouchers/model/voucher_data.dart';

class VoucherCard extends StatelessWidget {
  final VoucherData data;
  const VoucherCard({super.key, required this.data});

  String headingText() {
    String text = "(${data.theaterName ?? "All Partnered Cinemas"}) ";
    text += voucherText();
    return text;
  }

  String voucherText() {
    if (data.isPerk) return "${data.perkMessage}";
    return parseDiscount();
  }

  String parseDiscount() {
    if (data.discountAmountType == "Absolute") {
      return "${data.discountAmount} EGP off";
    } else {
      return "${data.discountAmount}% off";
    }
  }

  //examples (not yet implemented)
  String subText() {
    return "Only on Tuesdays · Valid till May 31st";
  }

  String termsAndConditions() {
    return "Max discount 300 EGP";
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: data.claimed ? Theme.of(context).colorScheme.surfaceDim : null,
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 8, 16),
        child: Row(
          children: [
            Icon(Icons.auto_awesome_sharp),
            SizedBox(width: 8),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    headingText(),
                    overflow: TextOverflow.fade,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, fontStyle: FontStyle.italic),
                  ),
                  Text(
                    subText(),
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      fontStyle: FontStyle.italic,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.navigate_next_rounded)),
          ],
        ),
      ),
    );
  }
}

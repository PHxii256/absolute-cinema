import 'package:flutter/material.dart';
import 'package:flutter_application/features/vouchers/model/voucher_data.dart';
import 'package:flutter_application/features/vouchers/viewmodel/voucher_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VoucherCard extends ConsumerWidget {
  final VoucherData data;
  const VoucherCard({super.key, required this.data});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IgnorePointer(
      ignoring: ref.read(voucherNotifierProvider.notifier).termsAndConditions(data) == "",
      child: Card(
        elevation: 1,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
          child: Theme(
            data: Theme.of(context).copyWith(
              dividerColor: Colors.transparent,
              splashColor: Theme.of(context).colorScheme.primary.withAlpha(15),
            ),
            child: ExpansionTile(
              enabled: data.claimed ? false : true,
              tilePadding: EdgeInsets.all(0),
              childrenPadding: EdgeInsets.all(0),
              showTrailingIcon: ref.read(voucherNotifierProvider.notifier).termsAndConditions(data) != "",
              title: Row(
                children: [
                  Icon(Icons.auto_awesome_sharp, color: Theme.of(context).colorScheme.primary),
                  SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ref.read(voucherNotifierProvider.notifier).headingText(data),
                          overflow: TextOverflow.fade,
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, fontStyle: FontStyle.italic),
                        ),
                        Text(
                          ref.read(voucherNotifierProvider.notifier).subText(data),
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            fontStyle: FontStyle.italic,
                            color:
                                data.claimed
                                    ? Theme.of(context).disabledColor
                                    : Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              expandedCrossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ref.read(voucherNotifierProvider.notifier).termsAndConditions(data),
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
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application/features/vouchers/view/add_voucher.dart';
import 'package:flutter_application/features/vouchers/view/widgets/voucher_tabs.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VoucherPage extends ConsumerWidget {
  const VoucherPage({super.key});

  bool hasVounchers() {
    return true;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(children: [AddVoucherComponent(), SizedBox(height: 8), VoucherTabBar()]),
    );
  }
}

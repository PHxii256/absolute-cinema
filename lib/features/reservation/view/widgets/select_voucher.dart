import 'package:flutter/material.dart';
import 'package:flutter_application/features/vouchers/model/voucher_data.dart';
import 'package:flutter_application/features/vouchers/view/widgets/voucher_card.dart';
import 'package:flutter_application/features/vouchers/viewmodel/applied_voucher.dart';
import 'package:flutter_application/features/vouchers/viewmodel/voucher_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectVoucher extends ConsumerStatefulWidget {
  final int screeningId;
  final DateTime screeningTimestamp;
  const SelectVoucher({super.key, required this.screeningId, required this.screeningTimestamp});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SelectVoucherState();
}

class _SelectVoucherState extends ConsumerState<SelectVoucher> {
  int _selectedIndex = -1;
  VoucherData? selectedVoucher;

  @override
  Widget build(BuildContext context) {
    final vouchers = ref.watch(voucherNotifierProvider);

    return AlertDialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 30),
      contentPadding: EdgeInsets.all(6),
      actionsPadding: EdgeInsets.fromLTRB(0, 0, 16, 12),
      title: const Text('Available Vouchers', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
      actions: <Widget>[
        TextButton(
          style: TextButton.styleFrom(textStyle: Theme.of(context).textTheme.labelLarge),
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          style: TextButton.styleFrom(textStyle: Theme.of(context).textTheme.labelLarge),
          child: const Text('Apply'),
          onPressed: () {
            Navigator.of(context).pop();
            if (selectedVoucher != null) {
              final errMsg = ref
                  .read(voucherNotifierProvider.notifier)
                  .validateVoucher(selectedVoucher!, widget.screeningId, widget.screeningTimestamp);
              if (errMsg.isNotEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(errMsg)));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Success Voucher Applied!"), duration: Duration(milliseconds: 1000)),
                );
                ref.read(appliedVoucherProvider.notifier).setVoucher(selectedVoucher);
              }
            }
          },
        ),
      ],
      content: SizedBox(
        width: 400,
        child: switch (vouchers) {
          AsyncData(:final value) => ListView.builder(
            shrinkWrap: true,
            itemCount: value.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                child: AbsorbPointer(
                  absorbing: _selectedIndex == index ? false : true,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      boxShadow:
                          _selectedIndex == index
                              ? [
                                BoxShadow(
                                  blurRadius: 30,
                                  spreadRadius: 0,
                                  color: Theme.of(context).colorScheme.inversePrimary.withAlpha(140),
                                  offset: Offset(0, 0),
                                ),
                              ]
                              : [],
                    ),
                    child:
                        ref.read(voucherNotifierProvider.notifier).isVoucherActive(value[index])
                            ? VoucherCard(data: value[index])
                            : Container(),
                  ),
                ),

                onTap: () {
                  setState(() {
                    _selectedIndex = index;
                    selectedVoucher = value[index];
                  });
                },
              );
            },
          ),

          AsyncError() => const Text('Oops, something unexpected happened'),
          _ => SizedBox(width: 30, height: 30, child: Center(child: const CircularProgressIndicator())),
        },
      ),
    );
  }
}


/*


*/
import 'package:flutter/material.dart';
import 'package:flutter_application/features/vouchers/viewmodel/voucher_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddVoucherComponent extends ConsumerStatefulWidget {
  const AddVoucherComponent({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _VoucherPageState();
}

class _VoucherPageState extends ConsumerState<AddVoucherComponent> {
  bool textFieldToggled = false;

  final TextEditingController _controller = TextEditingController();

  void applyPromoCode() async {
    final code = _controller.text;
    if (code.isNotEmpty) {
      final errMsg = await ref.read(voucherNotifierProvider.notifier).addPromoCode(code);
      if (errMsg != null && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(errMsg)));
      } else if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Promo code succefully added! :D")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            spreadRadius: 1,
            offset: Offset(0, 0),
            color: Theme.of(context).colorScheme.primary.withAlpha(20),
          ),
        ],
      ),
      child: Theme(
        data: Theme.of(context).copyWith(splashColor: Colors.transparent),

        child: Card.filled(
          elevation: 0,
          color: Theme.of(context).colorScheme.surface,
          child: ListTile(
            contentPadding: EdgeInsets.fromLTRB(16, 6, 16, 6),
            onTap: () {
              setState(() {
                textFieldToggled = true;
              });
            },
            leading: Icon(Icons.local_play_outlined),
            title:
                !textFieldToggled
                    ? Text(
                      "Have a promo code? Enter here",
                      style: TextStyle(fontWeight: FontWeight.w600, fontStyle: FontStyle.italic),
                    )
                    : TextField(
                      controller: _controller,
                      autofocus: true,
                      decoration: InputDecoration(hintText: 'Enter a valid promo code'),
                      autocorrect: false,
                      style: TextStyle(fontWeight: FontWeight.w600, fontStyle: FontStyle.italic),
                    ),
            trailing:
                textFieldToggled
                    ? IconButton(
                      onPressed: () {
                        setState(() {
                          textFieldToggled = false;
                          applyPromoCode();
                        });
                      },
                      icon: Icon(Icons.check_outlined),
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size(25, 25),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                    )
                    : SizedBox(width: 0, height: 0),
          ),
        ),
      ),
    );
  }
}

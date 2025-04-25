import 'package:flutter/material.dart';
import 'package:flutter_application/features/reservation/view/widgets/select_voucher.dart';
import 'package:flutter_application/features/reservation/viewmodel/seat_status_notifier.dart';
import 'package:flutter_application/features/search/model/movie_airing_info.dart';
import 'package:flutter_application/features/vouchers/viewmodel/applied_voucher.dart';
import 'package:flutter_application/features/vouchers/viewmodel/voucher_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_application/features/reservation/viewmodel/seat_layout_notifier.dart';

class PriceCalculator extends ConsumerWidget {
  final MovieAiringInfo airingInfo;
  const PriceCalculator({super.key, required this.airingInfo});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isleLayoutList = ref.watch(seatLayoutProvider(airingInfo));
    final reservedSeatsStatus = ref.watch(seatStatusProvider(airingInfo.screeningId));
    final appliedVoucher = ref.watch(appliedVoucherProvider);

    if (!isleLayoutList.hasValue || !reservedSeatsStatus.hasValue) return Container();

    final nonBookedReservedSeats =
        ref.read(seatStatusProvider(airingInfo.screeningId).notifier).getNonBookedReservedSeats();

    final int vipSeatsCount = nonBookedReservedSeats.where((seat) => seat.isVip).length;
    final int normalSeatsCount = nonBookedReservedSeats.length - vipSeatsCount;
    int getTotalPrice() => ref.read(seatStatusProvider(airingInfo.screeningId).notifier).getSubtotalPrice();
    int getDiscountedPrice() => ref.read(voucherNotifierProvider.notifier).getPriceAfterDiscount(getTotalPrice());
    int getVoucherCount() => ref.read(voucherNotifierProvider.notifier).getActiveVouchers().length;

    Widget getVoucherActionWidget() {
      if (getVoucherCount() == 0) return Container();
      if (appliedVoucher == null) {
        return Text("Apply a Voucher", style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic));
      }
      return Text("Remove Voucher", style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic));
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
      child: Builder(
        builder: (context) {
          if (!reservedSeatsStatus.hasValue) {
            if (reservedSeatsStatus.isLoading) {
              return Center(child: SizedBox(width: 40, height: 40, child: CircularProgressIndicator()));
            } else {
              return Container();
            }
          }
          return nonBookedReservedSeats.isNotEmpty
              ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    spacing: 3,
                    children: [
                      Text("Price:", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                      Text(
                        getTotalPrice().toString(),
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          decoration: appliedVoucher != null ? TextDecoration.lineThrough : null,
                          decorationThickness: appliedVoucher != null ? 1.5 : null,
                        ),
                      ),
                      appliedVoucher != null
                          ? Text(
                            getDiscountedPrice().toString(),
                            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                          )
                          : Container(),
                      Text("EGP", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  vipSeatsCount != 0 ? Text("${vipSeatsCount}x vip seat", style: TextStyle(fontSize: 14)) : Container(),
                  normalSeatsCount != 0
                      ? Text("${normalSeatsCount}x normal seat", style: TextStyle(fontSize: 14))
                      : Container(),
                  TextButton(
                    style: ButtonStyle(
                      padding: WidgetStatePropertyAll(EdgeInsets.all(0)),
                      visualDensity: VisualDensity.compact,
                      minimumSize: WidgetStatePropertyAll(Size(100, 20)),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: getVoucherActionWidget(),
                    onPressed: () {
                      appliedVoucher == null
                          ? showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return SelectVoucher(
                                screeningId: airingInfo.screeningId,
                                screeningTimestamp: airingInfo.screeningTimestamp,
                              );
                            },
                          )
                          : ref.read(appliedVoucherProvider.notifier).setVoucher(null);
                    },
                  ),
                ],
              )
              : Container();
        },
      ),
    );
  }
}

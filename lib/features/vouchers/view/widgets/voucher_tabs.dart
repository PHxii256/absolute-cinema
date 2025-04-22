import 'package:flutter/material.dart';
import 'package:flutter_application/features/vouchers/model/voucher_data.dart';
import 'package:flutter_application/features/vouchers/view/widgets/voucher_card.dart';
import 'package:flutter_application/features/vouchers/viewmodel/voucher_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VoucherTabBar extends ConsumerWidget {
  const VoucherTabBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final voucherProvider = ref.watch(voucherNotifierProvider);

    List<Widget> getCards(List<VoucherData> list, bool isActive) {
      final List<Widget> cards = [];
      for (var element in list) {
        if (isActive) {
          if (!element.claimed) cards.add(VoucherCard(data: element));
        } else {
          if (element.claimed) cards.add(VoucherCard(data: element));
        }
      }
      return cards;
    }

    Widget getWidget({required bool isActive}) {
      switch (voucherProvider) {
        case AsyncData(:final value):
          {
            return ListView(
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 4),
              children: [...getCards(value, isActive)],
            );
          }
        case AsyncError():
          return Text('Oops, an unexpected error happened');
        case AsyncLoading():
          return Center(child: SizedBox(width: 30, height: 30, child: CircularProgressIndicator()));
      }
      return Text('Oops, something unexpected happened');
    }

    return DefaultTabController(
      length: 3,
      child: Expanded(
        child: Scaffold(
          appBar: AppBar(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),

            title: const TabBar(
              labelStyle: TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
              indicatorPadding: EdgeInsets.symmetric(horizontal: 20),
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: [Tab(text: "Active"), Tab(text: "Used"), Tab(text: "Expired")],
            ),
          ),
          body: TabBarView(
            children: [getWidget(isActive: true), getWidget(isActive: false), getWidget(isActive: false)],
          ),
        ),
      ),
    );
  }
}

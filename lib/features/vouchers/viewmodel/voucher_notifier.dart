import 'package:flutter_application/features/vouchers/model/voucher_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
part 'voucher_notifier.g.dart';

@riverpod
class VoucherNotifier extends _$VoucherNotifier {
  @override
  Future<List<VoucherData>> build() async {
    return await _getVouchers();
  }

  Future<List<VoucherData>> _getVouchers() async {
    List<VoucherData> voucherResults = [];

    List<Map<String, dynamic>> dbResultList = await Supabase.instance.client
        .from('user_voucher')
        .select('claimed, voucher(*, theater(name))')
        .eq('user_id', Supabase.instance.client.auth.currentUser!.id);
    for (var result in dbResultList) {
      VoucherData data = VoucherData.fromJson(result);
      voucherResults.add(data);
    }
    return voucherResults;
  }
}

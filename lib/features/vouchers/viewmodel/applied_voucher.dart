import 'package:flutter_application/features/vouchers/model/voucher_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'applied_voucher.g.dart';

@riverpod
class AppliedVoucher extends _$AppliedVoucher {
  @override
  VoucherData? build() => null;
  void setVoucher(VoucherData? data) => state = data;
}

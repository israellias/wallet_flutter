import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wallet_flutter/Budget/provider/buget_provider.dart';
import 'package:wallet_flutter/Budget/utils/key_pad_utils.dart';
import 'package:wallet_flutter/base/utils/colors.dart';

class BudgetAmount extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    final forceComma = watch(forceCommaProvider).state;
    final tagAmount = watch(budgetAmountProvider).state;
    return Container(
      decoration: BoxDecoration(
        color: AppColor.whiteBlue.withOpacity(0.1),
        border: Border(
          bottom: BorderSide(
            color: AppColor.indigo.withOpacity(0.75),
            width: 2,
          ),
        ),
      ),
      padding: EdgeInsets.all(12),
      alignment: Alignment.centerRight,
      child: Text(
        KeyPadUtils.format(
          tagAmount,
          forceComma: forceComma,
        ),
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 24,
          color: AppColor.textColor,
        ),
      ),
    );
  }
}

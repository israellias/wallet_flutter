import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wallet_flutter/Tag/provider/tag_provider.dart';
import 'package:wallet_flutter/Tag/utils/key_pad_utils.dart';
import 'package:wallet_flutter/base/utils/colors.dart';

class TagAmount extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    final forceComma = watch(forceCommaProvider).state;
    final tagAmount = watch(tagAmountProvider).state;
    return Container(
      decoration: BoxDecoration(
        color: ValiuColor.whiteBlue.withOpacity(0.1),
        border: Border(
          bottom: BorderSide(
            color: ValiuColor.indigo.withOpacity(0.75),
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
          color: ValiuColor.textColor,
        ),
      ),
    );
  }
}

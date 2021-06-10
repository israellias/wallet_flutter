import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wallet_flutter/Budget/provider/buget_provider.dart';
import 'package:wallet_flutter/Budget/utils/key_enum.dart';
import 'package:wallet_flutter/Budget/utils/key_pad_utils.dart';
import 'package:wallet_flutter/base/ui/widgets/amount_pad.dart';
import 'package:wallet_flutter/base/ui/widgets/button_pad.dart';
import 'package:wallet_flutter/base/ui/widgets/custom_app_bar.dart';
import 'package:wallet_flutter/base/ui/widgets/custom_pad.dart';

class NumPad extends ConsumerWidget {
  final String title;

  NumPad({this.title});

  @override
  Widget build(BuildContext context, watch) {
    return Scaffold(
      appBar: CustomAppBar(
        title: title,
        withLogo: false,
        goBackButton: true,
        textSize: 24,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: AmountPad(),
                      ),
                      SizedBox(width: 24),
                      Container(
                        child: ButtonPad(),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          CustomPad(onChanged: (KeyEnum keyEnum) {
            final tagAmountNotifier =
                context.read(budgetAmountProvider.notifier);
            final forceCommaNotifier =
                context.read(forceCommaProvider.notifier);
            tagAmountNotifier.state = KeyPadUtils.updateAmount(
              tagAmountNotifier.state,
              keyEnum,
              forceComma: forceCommaNotifier.state,
            );
            forceCommaNotifier.state = keyEnum == KeyEnum.COMMA ||
                (keyEnum == KeyEnum.BACKSPACE &&
                    tagAmountNotifier.state.endsWith(','));
          }),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wallet_flutter/Tag/provider/tag_provider.dart';
import 'package:wallet_flutter/Tag/ui/widgets/tag_amount.dart';
import 'package:wallet_flutter/Tag/ui/widgets/tag_button.dart';
import 'package:wallet_flutter/Tag/ui/widgets/valiu_pad.dart';
import 'package:wallet_flutter/Tag/utils/key_enum.dart';
import 'package:wallet_flutter/Tag/utils/key_pad_utils.dart';
import 'package:wallet_flutter/base/ui/widgets/valiu_app_bar.dart';

class TagScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    return Scaffold(
      appBar: ValiuAppBar(
        title: 'Add amount tag',
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
                        child: TagAmount(),
                      ),
                      SizedBox(width: 24),
                      Container(
                        child: TagButton(),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          ValiuPad(onChanged: (KeyEnum keyEnum) {
            final tagAmountNotifier = context.read(tagAmountProvider.notifier);
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

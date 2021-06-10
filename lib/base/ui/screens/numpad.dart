import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wallet_flutter/Budget/utils/key_enum.dart';
import 'package:wallet_flutter/Budget/utils/key_pad_utils.dart';
import 'package:wallet_flutter/base/provider/pad_provider.dart';
import 'package:wallet_flutter/base/ui/widgets/amount_pad.dart';
import 'package:wallet_flutter/base/ui/widgets/button_pad.dart';
import 'package:wallet_flutter/base/ui/widgets/custom_app_bar.dart';
import 'package:wallet_flutter/base/ui/widgets/custom_pad.dart';
import 'package:wallet_flutter/base/ui/widgets/title_input.dart';

class NumPad extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    final NumPadArguments args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: CustomAppBar(
        title: args?.title,
        withLogo: false,
        goBackButton: true,
        textSize: 24,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  TitleInput(),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: AmountPad(),
                      ),
                      SizedBox(width: 24),
                      Container(
                        child: ButtonPad(
                          submit: args?.onSubmit,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          CustomPad(onChanged: (KeyEnum keyEnum) {
            final amountPadNotifier = context.read(amountPadProvider.notifier);
            final forceCommaNotifier =
                context.read(forceCommaProvider.notifier);
            amountPadNotifier.state = KeyPadUtils.updateAmount(
              amountPadNotifier.state,
              keyEnum,
              forceComma: forceCommaNotifier.state,
            );
            forceCommaNotifier.state = keyEnum == KeyEnum.COMMA ||
                (keyEnum == KeyEnum.BACKSPACE &&
                    amountPadNotifier.state.endsWith(','));
          }),
        ],
      ),
    );
  }
}

class NumPadArguments {
  final String title;
  final Function onSubmit;

  NumPadArguments(this.title, {this.onSubmit});
}

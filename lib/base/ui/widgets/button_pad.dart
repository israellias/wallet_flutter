import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wallet_flutter/base/provider/pad_provider.dart';
import 'package:wallet_flutter/base/utils/colors.dart';

class ButtonPad extends StatefulWidget {
  final Function submit;

  const ButtonPad({Key key, @required this.submit}) : super(key: key);

  @override
  _ButtonPadState createState() => _ButtonPadState();
}

class _ButtonPadState extends State<ButtonPad> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        final budget = watch(budgetProvider).state;
        return ElevatedButton(
          onPressed: () async {
            setState(() {
              loading = true;
            });
            await widget.submit(context);
            setState(() {
              loading = false;
            });

          },
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Text(
                  budget?.budgetId == null ? 'Add' : 'Edit',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                if (loading) SizedBox(width: 8),
                if (loading)
                  ConstrainedBox(
                    constraints: BoxConstraints.tightFor(width: 15, height: 15),
                    child: CircularProgressIndicator(
                      backgroundColor: AppColor.white,
                      strokeWidth: 2,
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}

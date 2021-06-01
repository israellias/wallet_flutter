import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wallet_flutter/Tag/ui/widgets/valiu_pad.dart';
import 'package:wallet_flutter/Tag/utils/key_enum.dart';
import 'package:wallet_flutter/Tag/utils/key_pad_utils.dart';
import 'package:wallet_flutter/base/ui/widgets/valiu_app_bar.dart';
import 'package:wallet_flutter/base/utils/colors.dart';

class TagScreen extends StatefulWidget {
  @override
  _TagScreenState createState() => _TagScreenState();
}

class _TagScreenState extends State<TagScreen> {
  String currentValue = '0';
  bool forceComma = false;

  @override
  Widget build(BuildContext context) {
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
                        child: Container(
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
                              currentValue,
                              forceComma: forceComma,
                            ),
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 24,
                              color: ValiuColor.textColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 24),
                      Container(
                        child: ElevatedButton(
                          onPressed: () {
                            FirebaseFirestore.instance.collection('tags').add({
                              'title': 'Amount',
                              'amount': KeyPadUtils.toDouble(currentValue),
                              'color':
                                  Random().nextInt(Colors.primaries.length),
                              'created_at': DateTime.now(),
                            }).then((value) {
                              Navigator.of(context).pop();
                            }).catchError((error) {
                              final snackBar =
                                  SnackBar(content: Text('Algo ha salido mal'));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            });
                          },
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: Text(
                              'Add',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          ValiuPad(onChanged: (KeyEnum keyEnum) {
            setState(() {
              currentValue = KeyPadUtils.updateAmount(
                currentValue,
                keyEnum,
                forceComma: forceComma,
              );
              forceComma = keyEnum == KeyEnum.COMMA ||
                  (keyEnum == KeyEnum.BACKSPACE && currentValue.endsWith(','));
            });
          }),
        ],
      ),
    );
  }
}

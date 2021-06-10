import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wallet_flutter/Budget/model/budget.dart';
import 'package:wallet_flutter/Budget/provider/buget_provider.dart';
import 'package:wallet_flutter/Budget/utils/key_pad_utils.dart';
import 'package:wallet_flutter/Budget/utils/budget_collection.dart';
import 'package:wallet_flutter/base/utils/colors.dart';

class ButtonPad extends StatefulWidget {
  @override
  _ButtonPadState createState() => _ButtonPadState();
}

class _ButtonPadState extends State<ButtonPad> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        final tag = watch(budgetProvider).state;
        return ElevatedButton(
          onPressed: () => submit(tag),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Text(
                  tag?.tagId == null ? 'Add' : 'Edit',
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

  void submit(Budget tag) {
    final String tagAmount = context.read(budgetAmountProvider).state;
    setState(() {
      loading = true;
    });
    if (tag?.tagId == null) {
      BudgetCollection.budgets.add({
        'title': 'Amount',
        // 'amount': tag.amount, -- TODO: pending to fix this. use the model
        'amount': KeyPadUtils.toDouble(tagAmount),
        'color': Random().nextInt(Colors.primaries.length),
        'created_at': DateTime.now(),
        'updated_at': DateTime.now(),
      }).then((value) {
        Navigator.of(context).pop();
      }).catchError((error) {
        final snackBar = SnackBar(content: Text("Sorry, can't add"));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        setState(() {
          loading = false;
        });
      });
    } else {
      BudgetCollection.budgets.doc(tag.tagId).update({
        // 'amount': tag.amount, -- TODO: pending to fix this. use the model
        'amount': KeyPadUtils.toDouble(tagAmount),
        'updated_at': DateTime.now(),
      }).then((value) {
        Navigator.of(context).pop();
      }).catchError((error) {
        final snackBar = SnackBar(content: Text("Sorry, can't update"));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        setState(() {
          loading = false;
        });
      });
    }
  }
}

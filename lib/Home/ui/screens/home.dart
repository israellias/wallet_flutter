import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wallet_flutter/Budget/utils/budget_collection.dart';
import 'package:wallet_flutter/Budget/utils/key_pad_utils.dart';
import 'package:wallet_flutter/Home/ui/widgets/budgets_viewer.dart';
import 'package:wallet_flutter/base/provider/pad_provider.dart';
import 'package:wallet_flutter/base/ui/screens/numpad.dart';
import 'package:wallet_flutter/base/ui/widgets/custom_sliver_app_bar.dart';
import 'package:wallet_flutter/base/utils/colors.dart';

class MyHomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          CustomSliverAppBar(),
          BudgetsViewer(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: ElevatedButton(
            onPressed: () {
              context.read(budgetProvider).state = null;
              context.read(amountPadProvider).state = '0';
              context.read(titleProvider).state = '';
              context.read(forceCommaProvider).state = false;
              Navigator.pushNamed(
                context,
                '/numpad/',
                arguments: NumPadArguments(
                  'Agregar Presupuesto',
                  onSubmit: (BuildContext context) async {
                    final amountPad = context.read(amountPadProvider).state;
                    final titlePad = context.read(titleProvider).state;
                    try {
                      await BudgetCollection.budgets.add({
                        'title': titlePad,
                        // 'amount': tag.amount, -- TODO: pending to fix this. use the model
                        'amount': KeyPadUtils.toDouble(amountPad),
                        'color': Random().nextInt(Colors.primaries.length),
                        'created_at': DateTime.now(),
                        'updated_at': DateTime.now(),
                      });
                      Navigator.of(context).pop();
                    } catch (error) {
                      final snackBar =
                          SnackBar(content: Text("Sorry, can't add"));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.all(16),
              child: Text(
                'Crear presupuesto',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: AppColor.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

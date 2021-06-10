import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wallet_flutter/Budget/model/budget.dart';
import 'package:wallet_flutter/Budget/utils/budget_collection.dart';
import 'package:wallet_flutter/Budget/utils/key_pad_utils.dart';
import 'package:wallet_flutter/base/provider/pad_provider.dart';
import 'package:wallet_flutter/base/ui/screens/numpad.dart';
import 'package:wallet_flutter/base/utils/colors.dart';

class BudgetCard extends ConsumerWidget {
  final Budget budget;

  const BudgetCard({Key key, this.budget}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    return Card(
      elevation: 1,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: Colors.primaries[budget.color],
                shape: BoxShape.circle,
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      KeyPadUtils.format(budget.amount.toString()),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColor.textColor,
                      ),
                    ),
                    Text(
                      budget.title,
                      style: TextStyle(
                        color: AppColor.gray1,
                      ),
                    )
                  ],
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                // setting current budget;
                context.read(budgetProvider.notifier).state = budget;

                context.read(amountPadProvider.notifier).state =
                    KeyPadUtils.format(budget.amount.toString())
                        .replaceAll('.', '');

                context.read(titleProvider).state = budget.title;

                context.read(forceCommaProvider.notifier).state = false;

                Navigator.pushNamed(
                  context,
                  '/numpad/',
                  arguments: NumPadArguments(
                    'Editar budget',
                    onSubmit: (BuildContext context) async {
                      final budget = context.read(budgetProvider).state;
                      final amountPad = context.read(amountPadProvider).state;
                      final titlePad = context.read(titleProvider).state;
                      try {
                        await BudgetCollection.budgets
                            .doc(budget.budgetId)
                            .update({
                          // 'amount': tag.amount, -- TODO: pending to fix this. use the model
                          'title': titlePad,
                          'amount': KeyPadUtils.toDouble(amountPad),
                          'updated_at': DateTime.now(),
                        });
                        Navigator.of(context).pop();
                      } catch (error) {
                        final snackBar =
                            SnackBar(content: Text("Sorry, can't update"));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                  ),
                );
              },
              child: Text(
                'Edit',
                style: TextStyle(color: AppColor.linkColor),
              ),
            ),
            TextButton(
              onPressed: () {
                BudgetCollection.budgets.doc(budget.budgetId).delete();
              },
              child: Text(
                'Delete',
                style: TextStyle(color: AppColor.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

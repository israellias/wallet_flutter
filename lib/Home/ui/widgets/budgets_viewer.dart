import 'package:flutter/material.dart';
import 'package:wallet_flutter/Home/ui/widgets/budget_card.dart';
import 'package:wallet_flutter/Budget/model/budget.dart';
import 'package:wallet_flutter/Budget/utils/budget_collection.dart';

class BudgetsViewer extends StatefulWidget {
  @override
  _BudgetsViewerState createState() => _BudgetsViewerState();
}

class _BudgetsViewerState extends State<BudgetsViewer> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: BudgetCollection.budgets
          .orderBy('created_at', descending: true)
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (!snapshot.hasData)
          return SliverToBoxAdapter(child: SizedBox.shrink());
        int length = snapshot.data.docs.length;
        if (length == 0) {
          return SliverToBoxAdapter(
            child: Center(
              child: Text('Aún no has agregado presupuestos'),
            ),
          );
        }
        return SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return BudgetCard(
              budget: Budget.fromJsonSnapshot(snapshot.data.docs[index]),
            );
          }, childCount: length),
        );
      },
    );
  }
}

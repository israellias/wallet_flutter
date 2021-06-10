import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wallet_flutter/Budget/provider/buget_provider.dart';
import 'package:wallet_flutter/Home/ui/widgets/budgets_viewer.dart';
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
              context.read(budgetProvider.notifier).state = null;
              context.read(budgetAmountProvider.notifier).state = '0';
              context.read(forceCommaProvider.notifier).state = false;
              Navigator.pushNamed(context, '/tag/');
            },
            child: Container(
              margin: EdgeInsets.all(16),
              child: Text(
                'Create amount tag',
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

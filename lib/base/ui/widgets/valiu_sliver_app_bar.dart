import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wallet_flutter/User/model/user_extension.dart';
import 'package:wallet_flutter/User/provider/user_provider.dart';
import 'package:wallet_flutter/base/utils/colors.dart';

class ValiuSliverAppBar extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    final user = watch(userProvider) as User;
    return SliverAppBar(
      expandedHeight: 120,
      backgroundColor: ValiuColor.background,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final settings = context
                .dependOnInheritedWidgetOfExactType<FlexibleSpaceBarSettings>();
            final bool isCollapsed =
                settings.minExtent == settings.currentExtent;

            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  if (user != null && !isCollapsed)
                    CircleAvatar(
                      backgroundImage: NetworkImage(user.gravatar),
                    ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 16),
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        'Presupuesto',
                        style: TextStyle(
                          color: ValiuColor.titleColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

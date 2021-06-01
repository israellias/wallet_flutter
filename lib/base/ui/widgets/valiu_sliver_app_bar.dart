import 'package:flutter/material.dart';
import 'package:wallet_flutter/base/ui/widgets/logo_header.dart';
import 'package:wallet_flutter/base/utils/colors.dart';

class ValiuSliverAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 160,
      backgroundColor: ValiuColor.background,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        // titlePadding: EdgeInsetsDirectional.only(
        //   start: 0.0,
        //   bottom: 16.0,
        // ),
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
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        'Amount tags',
                        style: TextStyle(
                          color: ValiuColor.titleColor,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  if (!isCollapsed) LogoHeader(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:wallet_flutter/base/ui/widgets/logo_header.dart';
import 'package:wallet_flutter/base/utils/colors.dart';

class ValiuAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const ValiuAppBar({
    Key key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              title,
              style: TextStyle(
                color: ValiuColor.titleColor,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            LogoHeader(),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(80);
}

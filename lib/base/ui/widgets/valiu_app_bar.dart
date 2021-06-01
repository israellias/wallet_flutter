import 'package:flutter/material.dart';
import 'package:wallet_flutter/base/ui/widgets/logo_header.dart';
import 'package:wallet_flutter/base/utils/colors.dart';

class ValiuAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool withLogo;
  final bool goBackButton;

  const ValiuAppBar({
    Key key,
    this.title,
    this.withLogo = true,
    this.goBackButton = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: SafeArea(
        child: Row(
          crossAxisAlignment: goBackButton
              ? CrossAxisAlignment.center
              : CrossAxisAlignment.end,
          textBaseline: TextBaseline.alphabetic,
          children: [
            if (goBackButton)
              IconButton(
                icon: Icon(Icons.arrow_back),
                iconSize: 32,
                onPressed: () => Navigator.pop(context),
              ),
            if (goBackButton) SizedBox(width: 8),
            Text(
              title,
              style: TextStyle(
                color: ValiuColor.titleColor,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (withLogo) Spacer(),
            if (withLogo) LogoHeader(),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(80);
}

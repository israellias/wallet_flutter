import 'package:flutter/material.dart';
import 'package:wallet_flutter/base/ui/widgets/logo_header.dart';
import 'package:wallet_flutter/base/utils/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool withLogo;
  final bool goBackButton;
  final double textSize;

  const CustomAppBar({
    Key key,
    this.title,
    this.withLogo = true,
    this.goBackButton = false,
    this.textSize = 32.0,
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
                iconSize: textSize,
                onPressed: () => Navigator.pop(context),
              ),
            if (goBackButton) SizedBox(width: 8),
            Text(
              title,
              style: TextStyle(
                color: AppColor.titleColor,
                fontSize: textSize,
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

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogoHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: 48),
      margin: EdgeInsets.symmetric(vertical: 4),
      child: SvgPicture.asset(
        'assets/img/logo.svg',
      ),
    );
  }
}

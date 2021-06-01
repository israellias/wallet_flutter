import 'package:flutter/material.dart';
import 'package:wallet_flutter/Tag/utils/key_enum.dart';
import 'package:wallet_flutter/base/utils/colors.dart';

class ValiuPad extends StatelessWidget {
  final ValueChanged<KeyEnum> onChanged;

  const ValiuPad({Key key, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 8 / 9 * MediaQuery.of(context).size.width,
      child: GridView.count(
        crossAxisCount: 3,
        physics: NeverScrollableScrollPhysics(),
        childAspectRatio: 3 / 2,
        children: KeyEnum.values
            .map<Widget>((e) => Container(
                  alignment: Alignment.center,
                  child: buildKey(e),
                ))
            .toList(),
      ),
    );
  }

  Widget buildKey(KeyEnum keyEnum) {
    Widget content;
    final textStyle = TextStyle(
      fontSize: 20,
      color: ValiuColor.gray1,
      fontWeight: FontWeight.w500,
    );
    switch (keyEnum) {
      case KeyEnum.ONE:
        content = Text('1', style: textStyle);
        break;
      case KeyEnum.TWO:
        content = Text('2', style: textStyle);
        break;
      case KeyEnum.THREE:
        content = Text('3', style: textStyle);
        break;
      case KeyEnum.FOUR:
        content = Text('4', style: textStyle);
        break;
      case KeyEnum.FIVE:
        content = Text('5', style: textStyle);
        break;
      case KeyEnum.SIX:
        content = Text('6', style: textStyle);
        break;
      case KeyEnum.SEVEN:
        content = Text('7', style: textStyle);
        break;
      case KeyEnum.EIGHT:
        content = Text('8', style: textStyle);
        break;
      case KeyEnum.NINE:
        content = Text('9', style: textStyle);
        break;
      case KeyEnum.COMMA:
        content = Text(',', style: textStyle);
        break;
      case KeyEnum.ZERO:
        content = Text('0', style: textStyle);
        break;
      case KeyEnum.BACKSPACE:
        content = Icon(Icons.backspace);
        break;
    }

    return InkWell(
      onTap: () {
        onChanged(keyEnum);
      },
      child: Container(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: content,
        ),
      ),
    );
  }
}

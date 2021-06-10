import 'package:intl/intl.dart';
import 'package:wallet_flutter/Budget/utils/key_enum.dart';

class KeyPadUtils {
  static String updateAmount(String amount, KeyEnum keyEnum,
      {bool forceComma = false}) {
    String newAmount;
    switch (keyEnum) {
      case KeyEnum.ONE:
        newAmount = amount + '1';
        break;
      case KeyEnum.TWO:
        newAmount = amount + '2';
        break;
      case KeyEnum.THREE:
        newAmount = amount + '3';
        break;
      case KeyEnum.FOUR:
        newAmount = amount + '4';
        break;
      case KeyEnum.FIVE:
        newAmount = amount + '5';
        break;
      case KeyEnum.SIX:
        newAmount = amount + '6';
        break;
      case KeyEnum.SEVEN:
        newAmount = amount + '7';
        break;
      case KeyEnum.EIGHT:
        newAmount = amount + '8';
        break;
      case KeyEnum.NINE:
        newAmount = amount + '9';
        break;
      case KeyEnum.COMMA:
        newAmount = amount.contains(',') ? amount : amount + ',';
        break;
      case KeyEnum.ZERO:
        newAmount = amount + '0';
        break;
      case KeyEnum.BACKSPACE:
        newAmount = amount.substring(0, amount.length - 1);
        break;
    }
    return newAmount;
  }

  static String format(String n, {bool forceComma = false}) {
    double numberResult = toDouble(n);

    // final formatting
    final formatter = NumberFormat('#,##0.#######', 'es_ES');
    // NumberFormat.currency(name: '').format(numberResult)
    String result = formatter.format(numberResult);

    // result
    return forceComma && !result.contains(',') ? '${result},' : result;
  }

  static double toDouble(String n) {
    String amount = n.endsWith(',') ? n.substring(0, n.length - 1) : n;
    amount = amount.replaceAll(',', '.');
    return double.tryParse(amount);
  }
}

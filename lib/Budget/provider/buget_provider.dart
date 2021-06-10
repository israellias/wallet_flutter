import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wallet_flutter/Budget/model/budget.dart';

final budgetProvider = StateProvider<Budget>((ref) => null);
final budgetAmountProvider = StateProvider<String>((ref) => '0');
final forceCommaProvider = StateProvider<bool>((ref) => false);

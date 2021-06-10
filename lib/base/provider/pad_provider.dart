import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wallet_flutter/Budget/model/budget.dart';

final budgetProvider = StateProvider<Budget>((ref) => null);
final amountPadProvider = StateProvider<String>((ref) => '0');
final titleProvider = StateProvider<String>((ref) => '');
final forceCommaProvider = StateProvider<bool>((ref) => false);

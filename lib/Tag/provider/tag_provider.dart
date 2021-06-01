import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wallet_flutter/Tag/model/tag.dart';

final tagProvider = StateProvider<Tag>((ref) => Tag());

final tagAmountProvider = StateProvider<String>((ref) => '0');
final forceCommaProvider = StateProvider<bool>((ref) => false);

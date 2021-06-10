import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wallet_flutter/base/provider/pad_provider.dart';

class TitleInput extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: TextFormField(
        initialValue: watch(titleProvider).state,
        onChanged: (value) {
          context.read(titleProvider).state = value;
        },
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Título',
        ),
      ),
    );
  }
}

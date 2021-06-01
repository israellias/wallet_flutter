import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wallet_flutter/Tag/model/tag.dart';
import 'package:wallet_flutter/Tag/provider/tag_provider.dart';
import 'package:wallet_flutter/Tag/utils/key_pad_utils.dart';

class TagButton extends StatefulWidget {
  @override
  _TagButtonState createState() => _TagButtonState();
}

class _TagButtonState extends State<TagButton> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        final tag = watch(tagProvider).state;
        return ElevatedButton(
          onPressed: () => submit(tag),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              tag?.tagId == null ? 'Add' : 'Edit',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        );
      },
    );
  }

  void submit(Tag tag) {
    final String tagAmount = context.read(tagAmountProvider).state;
    if (tag?.tagId == null) {
      FirebaseFirestore.instance
          .collection('tags')
          .add({
            'title': 'Amount',
            // 'amount': tag.amount, -- TODO: pending to fix this. use the model
            'amount': KeyPadUtils.toDouble(tagAmount),
            'color': Random().nextInt(Colors.primaries.length),
            'created_at': DateTime.now(),
            'updated_at': DateTime.now(),
          })
          .then((value) => Navigator.of(context).pop())
          .catchError((error) {
            final snackBar = SnackBar(content: Text("Sorry, can't add"));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          });
    } else {
      FirebaseFirestore.instance
          .collection('tags')
          .doc(tag.tagId)
          .update({
            // 'amount': tag.amount, -- TODO: pending to fix this. use the model
            'amount': KeyPadUtils.toDouble(tagAmount),
            'updated_at': DateTime.now(),
          })
          .then((value) => Navigator.of(context).pop())
          .catchError((error) {
            final snackBar = SnackBar(content: Text("Sorry, can't update"));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          });
    }
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wallet_flutter/Tag/utils/key_pad_utils.dart';
import 'package:wallet_flutter/base/utils/colors.dart';

class TagCard extends StatelessWidget {
  final String tagId;
  final tag;

  const TagCard({
    Key key,
    this.tagId,
    this.tag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: Colors.primaries[tag['color']],
                shape: BoxShape.circle,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    KeyPadUtils.format(tag['amount'].toString()),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: ValiuColor.textColor,
                    ),
                  ),
                  Text(
                    tag['title'],
                    style: TextStyle(
                      color: ValiuColor.gray1,
                    ),
                  )
                ],
              ),
            ),
            Spacer(),
            TextButton(
              onPressed: () {},
              child: Text(
                'Edit',
                style: TextStyle(color: ValiuColor.linkColor),
              ),
            ),
            TextButton(
              onPressed: () {
                FirebaseFirestore.instance
                    .collection('tags')
                    .doc(tagId)
                    .delete();
              },
              child: Text(
                'Delete',
                style: TextStyle(color: ValiuColor.red),
              ),
            ),
          ],
        ),
      ),
    );
    return Row(
      children: [],
    );
  }
}

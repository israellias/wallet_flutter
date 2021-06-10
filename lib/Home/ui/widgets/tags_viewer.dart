import 'package:flutter/material.dart';
import 'package:wallet_flutter/Home/ui/widgets/tag_card.dart';
import 'package:wallet_flutter/Tag/model/tag.dart';
import 'package:wallet_flutter/Tag/utils/tag_collection.dart';

class TagsViewer extends StatefulWidget {
  @override
  _TagsViewerState createState() => _TagsViewerState();
}

class _TagsViewerState extends State<TagsViewer> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: TagCollection.tags
          .orderBy('created_at', descending: true)
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (!snapshot.hasData)
          return SliverToBoxAdapter(child: SizedBox.shrink());
        int length = snapshot.data.docs.length;
        if (length == 0) {
          return SliverToBoxAdapter(
            child: Center(
              child: Text('Aún no has agregado tags'),
            ),
          );
        }
        return SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return TagCard(
              tag: Tag.fromJsonSnapshot(snapshot.data.docs[index]),
            );
          }, childCount: length),
        );
      },
    );
  }
}

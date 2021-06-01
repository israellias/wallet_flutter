import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wallet_flutter/Home/ui/widgets/tag_card.dart';
import 'package:wallet_flutter/Tag/model/tag.dart';
import 'package:wallet_flutter/Tag/provider/tag_provider.dart';
import 'package:wallet_flutter/base/ui/widgets/valiu_app_bar.dart';
import 'package:wallet_flutter/base/utils/colors.dart';

class MyHomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    return Scaffold(
      appBar: ValiuAppBar(
        title: 'Amount tags',
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance.collection('tags').snapshots(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (!snapshot.hasData) return SizedBox.shrink();
                int length = snapshot.data.docs.length;
                if (length == 0)
                  return Center(
                    child: Text('Aún no has agregado tags'),
                  );
                return ListView.builder(
                  itemCount: length,
                  itemBuilder: (context, index) {
                    return TagCard(
                      tag: Tag.fromJsonSnapshot(snapshot.data.docs[index]),
                    );
                  },
                );
              },
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: ElevatedButton(
              onPressed: () {
                context.read(tagProvider.notifier).state = null;
                context.read(tagAmountProvider.notifier).state = '0';
                context.read(forceCommaProvider.notifier).state = false;
                Navigator.pushNamed(context, '/tag/');
              },
              child: Container(
                margin: EdgeInsets.all(16),
                child: Text(
                  'Create amount tag',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: ValiuColor.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

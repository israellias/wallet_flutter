import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wallet_flutter/base/ui/widgets/valiu_app_bar.dart';
import 'package:wallet_flutter/base/utils/colors.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ValiuAppBar(
        title: widget.title,
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
                    return ListTile(
                      title: Text(
                        snapshot.data.docs[index].get('title').toString(),
                      ),
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

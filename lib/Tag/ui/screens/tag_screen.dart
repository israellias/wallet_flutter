import 'package:flutter/material.dart';
import 'package:wallet_flutter/base/ui/widgets/valiu_app_bar.dart';
import 'package:wallet_flutter/base/utils/colors.dart';

class TagScreen extends StatefulWidget {
  @override
  _TagScreenState createState() => _TagScreenState();
}

class _TagScreenState extends State<TagScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ValiuAppBar(
        title: 'Add amount tag',
        withLogo: false,
        goBackButton: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Text('asdf'),
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

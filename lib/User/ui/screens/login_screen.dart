import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wallet_flutter/User/provider/user_provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _phoneController = TextEditingController();
  final _smsCodeController = TextEditingController();
  String verificationId;

  @override
  void dispose() {
    _phoneController.dispose();
    _smsCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Column(
              children: [
                TextField(
                  controller: _phoneController,
                  autofocus: true,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Número de teléfono',
                  ),
                ),
                SizedBox(width: 16),
                Visibility(
                  visible: verificationId != null,
                  child: TextField(
                    controller: _smsCodeController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Código SMS',
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Consumer(
                  builder: (context, watch, child) {
                    return Column(
                      children: [
                        if (verificationId == null)
                          ElevatedButton(
                            onPressed: () {
                              context
                                  .read(userProvider.notifier)
                                  .verifyPhoneNumber(
                                _phoneController.text,
                                onCodeSent: (
                                  verificationId,
                                  int resendToken,
                                ) async {
                                  setState(() {
                                    this.verificationId = verificationId;
                                  });
                                },
                              );
                            },
                            child: Text('Solicitar SMS'),
                          ),
                        if (verificationId != null)
                          ElevatedButton(
                            onPressed: () {
                              context.read(userProvider.notifier).verifySmsCode(
                                  _smsCodeController.text, verificationId);
                            },
                            child: Text('Confirmar código SMS'),
                          ),
                      ],
                    );
                  },
                ),
                Text(
                  'Te enviaremos un código por SMS',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wallet_flutter/Home/ui/screens/home.dart';
import 'package:wallet_flutter/User/provider/user_provider.dart';
import 'package:wallet_flutter/User/ui/screens/login_screen.dart';

class AppRouter extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    final user = watch(userProvider);

    if (user == null) {
      return LoginScreen();
    }

    return MyHomePage();
  }
}

import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';

extension UserExtension on User {
  String get gravatarHash => phoneNumber != null
      ? md5.convert(utf8.encode(phoneNumber)).toString()
      : null;

  get gravatar => 'https://www.gravatar.com/avatar/$gravatarHash?d=identicon';
}

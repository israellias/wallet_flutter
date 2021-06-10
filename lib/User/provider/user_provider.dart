import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userProvider = StateNotifierProvider((ref) {
  return UserState();
});

class UserState extends StateNotifier<User> {
  UserState() : super(FirebaseAuth.instance.currentUser);

  void verifySmsCode(String smsCode, String verificationId) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: smsCode);
    final userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);

    // Updating state
    state = userCredential.user;
  }

  void verifyPhoneNumber(String phoneNumber, {PhoneCodeSent onCodeSent}) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    await auth.verifyPhoneNumber(
      phoneNumber: '+591$phoneNumber',
      verificationCompleted: (PhoneAuthCredential credential) async {
        print('Verification completed');
        final userCredential = await auth.signInWithCredential(credential);

        // Updating state
        state = userCredential.user;
      },
      verificationFailed: (FirebaseAuthException e) {
        print('Verification failed');
        print(e.code);
      },
      codeSent: onCodeSent,
      codeAutoRetrievalTimeout: (String verificationId) {
        print('Code Autoretrieval Timeout');
      },
    );
  }
}

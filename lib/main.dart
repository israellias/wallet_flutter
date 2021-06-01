import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:wallet_flutter/Home/ui/screens/home.dart';
import 'package:wallet_flutter/Tag/ui/screens/tag_screen.dart';
import 'package:wallet_flutter/base/utils/colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {}
}

class MyApp extends StatefulWidget {
  _AppState createState() => _AppState();
}

class _AppState extends State<MyApp> {
  // Set default `_initialized` and `_error` state to false
  bool _initialized = false;
  bool _error = false;

  // Define an async function to initialize FlutterFire
  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _materialApp();
  }

  Widget _materialApp() {
    // Show error message if initialization failed
    if (_error) {
      return Text('Error al iniciar');
    }

    // Show a loader until FlutterFire is initialized
    if (!_initialized) {
      return CircularProgressIndicator();
    }

    return MaterialApp(
      title: 'Valiu Wallet',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: ValiuColor.primaryColor,
        scaffoldBackgroundColor: ValiuColor.background,
        fontFamily: 'Inter',
        backgroundColor: ValiuColor.indigo,
        canvasColor: ValiuColor.white,
        buttonTheme: ButtonThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        cardTheme: CardTheme(
          shadowColor: ValiuColor.gray2,
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(title: 'Amount tags'),
        '/tag/': (context) => TagScreen(),
      },
    );
  }
}

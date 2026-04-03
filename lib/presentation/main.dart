import 'package:flutter/material.dart';
import 'package:glamme/domain/globals.dart';
import 'package:glamme/presentation/mainScreens/mainPage.dart';
import 'package:glamme/presentation/uikit/colors.dart';

// Точка входа в мобильное приложение
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initPrefs();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GlamMe',
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

// Экран SplashScreen
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override

  //
  void initState() {
    super.initState();
    initPrefs();
    Future.delayed(Duration(seconds: 2), () => navToSignIn(context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Center(
          child: Image.asset('assets/images/logo.png', width: 140, height: 160),
        ),
      ),
    );
  }
}

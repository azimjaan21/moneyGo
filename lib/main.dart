import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:money_go/screens/splash.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Money Go',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          canvasColor: Colors.transparent,
          primarySwatch: Colors.deepPurple,
          fontFamily: 'OpenSans'),
      home: SplashScreen(),
    );
  }
}

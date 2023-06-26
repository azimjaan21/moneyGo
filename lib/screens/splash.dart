import 'package:flutter/material.dart';
import 'package:money_go/screens/user.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 5)).then((value) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (ctx) => UserScreen(),
        ),
      );
    });
  }
  

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Color(0xffeee4ff),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
            Image.asset('assets/icon/logo.png'),
            
             SpinKitThreeInOut(
              size: 40,
  itemBuilder: (BuildContext context, int index) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: index.isEven ? const Color(0xff7356f7) : Color.fromARGB(255, 39, 37, 37),
        
      ),
      
    );
  },
),
          ],
        ),
      ),
    );
  }
}

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:le_eats/view/splash/skip_splash.dart';

import '../../utils/app_constant.dart';
import '../../utils/app_sp.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // Future isLogged = AppSp().getIsLogged();
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () async {
      // bool val = await AppSp().getIsLogged();
      // if (val) {
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(builder: (context) => const DashHomeScreen()),
      //   );
      // } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SkipSplash()),
        );
      }
    // }
    );
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFEEF3),
      body: Stack(
        children:[
          Positioned.fill(
          child:Image.asset(logo,
            fit: BoxFit.cover,

          ) ,
        ),
    ],
      ),
    );
  }
}

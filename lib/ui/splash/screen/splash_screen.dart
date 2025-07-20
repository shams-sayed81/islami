import 'dart:async';

import 'package:flutter/material.dart';
import 'package:islamic13/model/PrefHelper.dart';
import 'package:islamic13/style/assets_manager.dart';
import 'package:islamic13/ui/home/screen/home_screen.dart';
import 'package:islamic13/ui/onboarding/screen/onboarding.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = 'splash';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {

    super.initState();
    Timer(const Duration(seconds: 2), () {
      bool check= PrefHelper.getBool('IsOpen')?? true;
      Navigator.pushReplacementNamed(context, check? Onboarding.routeName: HomeScreen.routeName  );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(
        AssetsManager.splash,
        width: double.infinity,
        fit: BoxFit.fill,
      ),
    );
  }
}

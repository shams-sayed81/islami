import 'package:flutter/material.dart';
import 'package:islamic13/style/colors_manager.dart';

import '../../../style/assets_manager.dart';
class AhadithTab extends StatelessWidget {
  const AhadithTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: ColorsManager.secondary,
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                  width: double.infinity,
                  AssetsManager.ahadithBack),
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Color.fromRGBO(14, 14, 14, 1),
                        Color.fromRGBO(14, 14, 14, 0),
                      ]),
                ),
              ),
            ],)],
      ),
    );
  }
}







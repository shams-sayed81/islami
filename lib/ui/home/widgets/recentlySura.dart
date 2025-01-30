import 'package:flutter/material.dart';
import 'package:islamic13/style/assets_manager.dart';
import 'package:islamic13/style/colors_manager.dart';

class Recentlysura extends StatelessWidget {
  const Recentlysura({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ColorsManager.primary),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Al-Anbiya',
                    style: TextStyle(
                        fontSize: 24,
                        color: ColorsManager.secondary,
                        fontWeight: FontWeight.w700)),
                Text('الأنبياء' , style: TextStyle(
                    fontSize: 24,
                    color: ColorsManager.secondary,
                    fontWeight: FontWeight.w700)),
                Text('112 Verses ' , style: TextStyle(
                    fontSize: 14,
                    color: ColorsManager.secondary,
                    fontWeight: FontWeight.w700))
              ],
            ),
          ),
          Image.asset(AssetsManager.quranCard),
        ],
      ),
    );
  }
}

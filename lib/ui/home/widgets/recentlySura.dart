import 'package:flutter/material.dart';
import 'package:islamic13/model/suraModel.dart';
import 'package:islamic13/style/assets_manager.dart';
import 'package:islamic13/style/colors_manager.dart';
import 'package:islamic13/ui/home/widgets/sura_item.dart';

class Recentlysura extends StatelessWidget {
  Surah surah ;
   Recentlysura({required this.surah});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ColorsManager.primary),
      child: Row(
        children: [
           Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(surah.englishName,
                    style: const TextStyle(
                      fontFamily: 'Janna',

                        fontSize: 24,
                        color: ColorsManager.secondary,
                        fontWeight: FontWeight.w700)),
                Text(surah.arabicName , style: const TextStyle(
                    fontFamily: 'Janna',
                    fontSize: 24,
                    color: ColorsManager.secondary,
                    fontWeight: FontWeight.w700)),
                Text(surah.numberOfVerses ,

                    style: const TextStyle(
                    fontSize: 14,
                        fontFamily: 'Janna',
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

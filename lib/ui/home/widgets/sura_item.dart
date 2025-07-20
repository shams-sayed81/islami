import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islamic13/model/suraModel.dart';
import 'package:islamic13/style/assets_manager.dart';
import 'package:islamic13/ui/suraDetails/screen/suraDetails.dart';

class SuraItem extends StatelessWidget {
  Surah surah;
  void Function () addToRecent;

  SuraItem({required this.surah , required this.addToRecent});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        addToRecent();
        Navigator.pushNamed(context, Suradetails.routeName ,arguments:surah);

      },
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SvgPicture.asset(AssetsManager.suraNumber),
              Text(
                surah.order,
                style: const TextStyle(fontSize: 20, color: Colors.white),
              )
            ],
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(surah.englishName,
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w700)),
                Text('${surah.numberOfVerses} verses',
                    style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w700))
              ],
            ),
          ),
          Text(surah.arabicName,
              style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w700)),
        ],
      ),
    );
  }
}

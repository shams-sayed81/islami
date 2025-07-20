import 'package:flutter/material.dart';
import 'package:islamic13/style/assets_manager.dart';
import 'package:islamic13/style/colors_manager.dart';

class AzkarItem extends StatelessWidget {
  final String asset;
  final String azkar;
  const AzkarItem({super.key, required this.asset, required this.azkar});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const  EdgeInsets.symmetric( horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: ColorsManager.primary, width: 2),
        color: Colors.black54,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(asset),
          const SizedBox(height: 10,),
          Text(
            azkar,
            style: const TextStyle(
                fontSize: 24, color: Colors.white, fontWeight: FontWeight.w700),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:islamic13/model/onboardingModel.dart';

import '../../../style/colors_manager.dart';

class OnboardingItem extends StatelessWidget {
  final OnboardingModel onboardingModel;
  const OnboardingItem({super.key, required this.onboardingModel});

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.sizeOf(context).height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment:  MainAxisAlignment.spaceAround,
      children: [
        Image.asset(onboardingModel.path, height: height*.4 , ),
        Text(onboardingModel.title ,

          style: const TextStyle(
              fontFamily: 'Janna',
              fontWeight: FontWeight.w700,
              color: ColorsManager.primary,
              fontSize: 24),),
        Text(onboardingModel.disc??'' ,
          textAlign: TextAlign.center,
          style:const TextStyle(
              fontFamily: 'Janna',
              fontWeight: FontWeight.w700,
              color: ColorsManager.primary,
              fontSize: 20),),
      ],
    );
  }
}
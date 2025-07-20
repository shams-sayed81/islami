import 'package:flutter/material.dart';
import 'package:islamic13/model/PrefHelper.dart';
import 'package:islamic13/model/onboardingModel.dart';
import 'package:islamic13/style/assets_manager.dart';
import 'package:islamic13/style/colors_manager.dart';
import 'package:islamic13/ui/home/screen/home_screen.dart';
import 'package:islamic13/ui/onboarding/widgets/onboarding_item.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatefulWidget {
   Onboarding({super.key});
  static const String routeName = 'onboarding';
  int index =0;
  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  PageController controller =PageController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    PrefHelper.onboardingOpened('IsOpen', true);

    
  }
  @override
  Widget build(BuildContext context) {


    return SafeArea(
        child: Scaffold(
      backgroundColor: ColorsManager.secondary,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              AssetsManager.logo,
              alignment: Alignment.center,
            ),
            Expanded(
                child: PageView.builder(
                  controller: controller,
                  onPageChanged: (value) {
                    widget.index=value;
                    setState(() {

                    });
                  },
                  itemCount:OnboardingModel.onboardingList.length ,
              itemBuilder: (context, index) => OnboardingItem(
                  onboardingModel: OnboardingModel.onboardingList[index]),
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                 Visibility(
                   visible: widget.index!=0,
                   replacement: Spacer(),
                   child: TextButton(

                    onPressed: () {

                        controller.previousPage(
                            duration:const Duration(milliseconds: 500),
                            curve: Curves.bounceInOut);
                        while(widget.index >0) {
                        widget.index--;
                      }
                    },
                    child: const Text(
                      'Back',
                      style: TextStyle(
                          fontFamily: 'Janna',
                          fontWeight: FontWeight.w700,
                          color: ColorsManager.primary,
                          fontSize: 16),
                    ),
                                   ),
                 ),
                const Spacer(),

                AnimatedSmoothIndicator(

                  activeIndex: widget.index,
                  count: OnboardingModel.onboardingList.length,
                  effect: const ExpandingDotsEffect(
                      dotWidth: 7,
                      dotHeight: 7,
                      dotColor: ColorsManager.darkGray,
                      activeDotColor: ColorsManager.primary),
                ),
                const Spacer(),



                TextButton(
                  onPressed: () {
                    if(widget.index ==OnboardingModel.onboardingList.length-1){
                      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
                      return;
                    }
                    controller.nextPage(
                        duration:const Duration(milliseconds: 500),
                        curve: Curves.bounceInOut);

                   while(widget.index <OnboardingModel.onboardingList.length) {
                     widget.index++;
                   }

                  },
                  child:  Text(
                    widget.index ==OnboardingModel.onboardingList.length-1? 'Finish' : 'Next',
                    style: const TextStyle(
                        fontFamily: 'Janna',
                        fontWeight: FontWeight.w700,
                        color: ColorsManager.primary,
                        fontSize: 16),
                  ),
                ),

              ],
            )
          ],
        ),
      ),
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islamic13/style/assets_manager.dart';
import 'package:islamic13/style/colors_manager.dart';
import 'package:islamic13/style/strings_manager.dart';
import 'package:islamic13/ui/home/tabs/ahadith_tab.dart';
import 'package:islamic13/ui/home/tabs/quran_tab.dart';
import 'package:islamic13/ui/home/tabs/radio_tab.dart';
import 'package:islamic13/ui/home/tabs/sebha_tab.dart';
import 'package:islamic13/ui/home/tabs/time_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';
   const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex=0;
  List tabs =  [
     QuranTab(),
     AhadithTab(),
   const SebhaTab(),
   const RadioTab(),
   const TimeTab()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,


      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (index){
          setState(() {
            selectedIndex=index;
          });
        },
        backgroundColor: ColorsManager.primary,
        indicatorColor: ColorsManager.navBack, //selected tab icon color
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        destinations: [
          NavigationDestination(

              icon: SvgPicture.asset(
                AssetsManager.quran,
                colorFilter: const ColorFilter.mode(
                    ColorsManager.secondary, BlendMode.srcIn),
              ),
              selectedIcon: SvgPicture.asset(
                AssetsManager.quran,
                colorFilter: const ColorFilter.mode(
                    ColorsManager.tertairy, BlendMode.srcIn),
              ),
              label: StringsManager.quran),


          NavigationDestination(
              icon: SvgPicture.asset(
                AssetsManager.ahadith,
                colorFilter: const ColorFilter.mode(
                    ColorsManager.secondary, BlendMode.srcIn),
              ),
              selectedIcon: SvgPicture.asset(
                AssetsManager.ahadith,
                colorFilter: const ColorFilter.mode(
                    ColorsManager.tertairy, BlendMode.srcIn),
              ),
              label: StringsManager.ahadith),


          NavigationDestination(
              icon: SvgPicture.asset(
                AssetsManager.sebha,
                colorFilter: const ColorFilter.mode(
                    ColorsManager.secondary, BlendMode.srcIn),
              ),
              selectedIcon: SvgPicture.asset(
                AssetsManager.sebha,
                colorFilter: const ColorFilter.mode(
                    ColorsManager.tertairy, BlendMode.srcIn),
              ),
              label: StringsManager.sebha),


          NavigationDestination(
              icon: SvgPicture.asset(
                AssetsManager.radio,
                colorFilter: const ColorFilter.mode(
                    ColorsManager.secondary, BlendMode.srcIn),
              ),
              selectedIcon: SvgPicture.asset(
                AssetsManager.radio,
                colorFilter: const ColorFilter.mode(
                    ColorsManager.tertairy, BlendMode.srcIn),
              ),
              label: StringsManager.radio),


          NavigationDestination(
              icon: SvgPicture.asset(
                AssetsManager.time,
                colorFilter: const ColorFilter.mode(
                    ColorsManager.secondary, BlendMode.srcIn),
              ),
              selectedIcon: SvgPicture.asset(
                AssetsManager.time,
                colorFilter: const ColorFilter.mode(
                    ColorsManager.tertairy, BlendMode.srcIn),
              ),
              label: StringsManager.time ),
        ],
      ),
      body: tabs[selectedIndex],
    );
  }
}

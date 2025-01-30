import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islamic13/model/constants.dart';
import 'package:islamic13/style/assets_manager.dart';
import 'package:islamic13/style/colors_manager.dart';
import 'package:islamic13/style/strings_manager.dart';
import 'package:islamic13/ui/home/widgets/recentlySura.dart';
import 'package:islamic13/ui/home/widgets/sura_item.dart';

class QuranTab extends StatelessWidget {

  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AssetsManager.quranBack), fit: BoxFit.fill)),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              Align(
                  alignment: Alignment.center,
                  child: Image.asset(AssetsManager.logo)),
              const SizedBox(
                height: 10,
              ),
              TextField(
                textAlignVertical: TextAlignVertical.center,
                style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    fontSize: 16),
                decoration: InputDecoration(
                  isCollapsed: true,
                  fillColor: ColorsManager.secondary.withOpacity(0.7),
                  filled: true,
                  hintText: 'Enter sura name',
                  hintStyle: const TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontSize: 16),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(10),
                    child: SvgPicture.asset(AssetsManager.quran),
                  ),
                  prefixIconConstraints:
                      const BoxConstraints(maxHeight: 45, maxWidth: 50),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: ColorsManager.primary,
                      )),
                ),
              ),
             const SizedBox(height: 20,),
              const Text(
                StringsManager.mostRecently,
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    fontSize: 18),
              ),

                  const SizedBox(height: 5,),

                  Expanded(
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context,index) => Recentlysura(),
                    separatorBuilder: (context,index) =>const SizedBox(width: 10,),
                      itemCount: 10,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    StringsManager.suraList,
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontSize: 18),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  Expanded(
                    child: ListView.separated(
                        itemCount:suraList.length,
                        itemBuilder: (context, index) => SuraItem(surah: suraList[index],),
                      separatorBuilder: ( context,  index) =>const Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 40),
                        child: Divider(
                          height: 30,
                        ),
                      ),),

                  )


            ]),
          ),
        ),
      ),
    );
  }
}

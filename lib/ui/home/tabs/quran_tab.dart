import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islamic13/model/PrefHelper.dart';
import 'package:islamic13/model/constants.dart';
import 'package:islamic13/style/assets_manager.dart';
import 'package:islamic13/style/colors_manager.dart';
import 'package:islamic13/style/strings_manager.dart';
import 'package:islamic13/ui/home/widgets/recentlySura.dart';
import 'package:islamic13/ui/home/widgets/sura_item.dart';

import '../../../model/suraModel.dart';

class QuranTab extends StatefulWidget {
  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  List<Surah> filterList = [];
  List<Surah> mostRecent =[];

  String searchValue = '';

  @override
  void initState() {
    super.initState();
    mostRecent=PrefHelper.getRecentList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(

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
              child:
                  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Align(
                    alignment: Alignment.center,
                    child: Image.asset(AssetsManager.logo)),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  cursorColor: ColorsManager.primary,
                  cursorErrorColor: ColorsManager.primary,
                  onChanged: (value) {

                    setState(() {
                      searchValue = value;
                      searchSura(value);
                    });

                  },
                  textAlignVertical: TextAlignVertical.center,
                  style: const TextStyle(
                      fontFamily: 'Janna',
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
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: ColorsManager.primary,
                        )),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                if(searchValue.isEmpty)
                  ...[
                    if (mostRecent.isNotEmpty)...[const Text(
                      StringsManager.mostRecently,
                      style: TextStyle(
                         fontFamily: 'Janna',
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          fontSize: 18),
                    ),
                      const SizedBox(
                        height: 5,
                      ),
                      Expanded(
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) =>  Recentlysura(surah:mostRecent[index] ,),
                          separatorBuilder: (context, index) => const SizedBox(
                            width: 10,
                          ),
                          itemCount: mostRecent.length,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),],

                    const Text(
                      StringsManager.suraList,
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          fontSize: 18),
                    ),
                    const SizedBox(
                      height: 10,
                    ),],
                Expanded(
                  child: ListView.separated(
                    itemCount:
                        searchValue.isEmpty ? suraList.length : filterList.length,
                    itemBuilder: (context, index) => SuraItem(
                      addToRecent: (){
                        for (int i=0; i<mostRecent.length; i++) {
                          if(mostRecent[i].englishName==
                              (searchValue.isEmpty?
                              suraList[index].englishName :
                              filterList[index].englishName)
                              ) {
                            mostRecent.removeAt(i);
                          }
                        }
                        mostRecent.insert(0, searchValue.isEmpty
                            ? suraList[index]
                            : filterList[index]);
                        PrefHelper.addRecentList(mostRecent);
                        setState(() {


                        });
                      },
                      surah: searchValue.isEmpty
                          ? suraList[index]
                          : filterList[index],
                    ),
                    separatorBuilder: (context, index) => const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Divider(
                        height: 30,
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }

  searchSura(String value) {
    filterList=[];
    for (int i = 0; i < suraList.length; i++) {
      if (suraList[i].arabicName.contains(value) ||
          suraList[i].englishName.contains(value)) {
        filterList.add(suraList[i]);
      }
    }
  }
}

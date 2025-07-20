import 'package:flutter/material.dart';
import 'package:islamic13/model/hadithModel.dart';

import '../../style/assets_manager.dart';
import '../../style/colors_manager.dart';

class HadithDetails extends StatelessWidget {
  static const String routeName ='hadithDetails';

  const HadithDetails({super.key});

  @override
  Widget build(BuildContext context) {
    HadithModel hadith = ModalRoute.of(context)!.settings.arguments as HadithModel;
    return Scaffold(
      backgroundColor: ColorsManager.secondary,

      appBar: AppBar(
        iconTheme: const IconThemeData(
            color:  ColorsManager.primary
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text('Hadith ${hadith.num}' , style:const TextStyle(color: ColorsManager.primary , fontWeight: FontWeight.w700, fontFamily: 'Janna'),),
      ),
      body: Column(

        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 20,left: 20,top: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(AssetsManager.rightCorner),
                      Text(hadith.title , style:const TextStyle(color: ColorsManager.primary ,
                          fontFamily: 'Janna' ,
                          fontWeight: FontWeight.w700,
                          fontSize: 20
                      ),),
                      Image.asset(AssetsManager.leftCorner),
                    ],
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(hadith.body , textDirection: TextDirection.rtl,
                        textAlign: TextAlign.center,
                        style:const TextStyle(color: ColorsManager.primary ,
                            height: 2,
                            fontFamily: 'Janna' ,
                            fontWeight: FontWeight.w700,
                            fontSize: 20
                        ),),
                    ),
                  )
                ],
              ),
            ),
          ),


          Image.asset(AssetsManager.mosque),
    ],
    ),
    );
  }
}

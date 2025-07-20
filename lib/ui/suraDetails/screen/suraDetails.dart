import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islamic13/model/suraModel.dart';
import 'package:islamic13/style/assets_manager.dart';
import 'package:islamic13/style/colors_manager.dart';

class Suradetails extends StatefulWidget {
  static const String routeName ='suraDetails';

    Suradetails({super.key});

  @override
  State<Suradetails> createState() => _SuradetailsState();
}

class _SuradetailsState extends State<Suradetails> {
  String suraText ='';

  @override
  Widget build(BuildContext context) {




    Surah surah = ModalRoute.of(context)!.settings.arguments as Surah;
    if (suraText.isEmpty){
      loadFile(surah.order.toString());

    }
    return Scaffold(
      backgroundColor: ColorsManager.secondary,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color:  ColorsManager.primary
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(surah.englishName , style:const TextStyle(color: ColorsManager.primary , fontWeight: FontWeight.w700, fontFamily: 'Janna'),),
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
                      Text(surah.arabicName , style:const TextStyle(color: ColorsManager.primary ,
                          fontFamily: 'Janna' ,
                          fontWeight: FontWeight.w700,
                          fontSize: 20
                      ),),
                      Image.asset(AssetsManager.leftCorner),
                    ],
                  ),
                 Expanded(
                    child: suraText.isEmpty?
                   const Center(child: CircularProgressIndicator(color: ColorsManager.primary,),)
                   :SingleChildScrollView(
                      child: Text(suraText, textDirection: TextDirection.rtl,
                        textAlign: TextAlign.center,
                        style:const TextStyle(color: ColorsManager.primary ,
                            height: 2,
                            fontFamily: 'Janna' ,
                            fontWeight: FontWeight.w700,
                            fontSize: 20
                        ),),
                    ),
                  ),
            
            
            
                ],
              ),
            ),
          ),
          Image.asset(AssetsManager.mosque),
        ],
      ),

    );


  }

  loadFile (String suraNum) async{
   suraText =await rootBundle.loadString('assets/suras/$suraNum.txt');
   List lines= suraText.split('\n');
   String temp='';

   for(int i =0; i<lines.length ; i++){
     temp+=lines[i].trim();
     temp+=' (${i+1}) ';

   }

   suraText=temp;
   setState(() {


 });


  }
}

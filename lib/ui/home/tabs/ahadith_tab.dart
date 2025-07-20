import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic13/style/colors_manager.dart';
import 'package:islamic13/ui/home/widgets/hadith_item.dart';

import '../../../model/hadithModel.dart';
import '../../../style/assets_manager.dart';
class AhadithTab extends StatefulWidget {
   AhadithTab({super.key});

  @override
  State<AhadithTab> createState() => _AhadithTabState();
}

class _AhadithTabState extends State<AhadithTab> {
  PageController controller =PageController(viewportFraction: 0.9);


@override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadFile();
  }
  @override
  Widget build(BuildContext context) {
    return
       SafeArea(
         child: Scaffold(
           backgroundColor: ColorsManager.secondary,
           body: Stack(
             children: [
               Image.asset(
                 fit: BoxFit.fill,
                   width: double.infinity,
                   //height: MediaQuery.of(context).size.height,
                   AssetsManager.ahadithBack),
               Container(
                 width: double.infinity,
                // height: MediaQuery.of(context).size.height,
                  decoration: const BoxDecoration(
                   gradient: LinearGradient(
                       begin: Alignment.bottomCenter,
                       end: Alignment.topCenter,
                       colors: [
                         Color.fromRGBO(14, 14, 14, 1),
                         Color.fromRGBO(14, 14, 14, 0),
                       ]),
                 ) ,
                 child:Column(
                   children: [
                     Image.asset(AssetsManager.logo),

                     Expanded(child:
                     ahadith.isEmpty? const Center(child: CircularProgressIndicator(color: ColorsManager.primary,),):
                     PageView.builder(

                       controller: controller,
                       itemCount: ahadith.length,
                       itemBuilder: (context, index) => HadithItem(hadithModel: ahadith[index],),))
                   ],
                 ),
               ),


             ],),
         ),
       );
  }
  List ahadith =[];

  loadFile() async {
    for (int i = 0; i < 50; i++) {
      String hadith = await rootBundle.loadString('assets/ahadith/h${i+1}.txt');

      List<String> lines = hadith.trim().split('\n');
      String title = lines[0];
      lines.removeAt(0);
      String content = lines.join(' ');
      ahadith.add(HadithModel(body: content, title: title, num: i + 1));
    }


    setState(() {});
  }


  }










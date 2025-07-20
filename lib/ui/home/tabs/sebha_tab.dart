import 'package:flutter/material.dart';

import '../../../style/assets_manager.dart';

class SebhaTab extends StatefulWidget {
   const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
 int counter =0;
 double angle =0;
 int index=0;
 List<String> list =['سبحان الله' , 'الله أكبر' ,'الحمدلله'];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(

            image: DecorationImage(

                image: AssetImage(AssetsManager.sebhaBack), fit: BoxFit.cover),),
        child: Column(

          children: [
            Image.asset(AssetsManager.logo),
            const SizedBox(height: 16,),
            const Text(
              textAlign: TextAlign.center,
              'سَبِّحِ اسْمَ رَبِّكَ الأعلى' , style: TextStyle(
                fontFamily: 'Janna',
                fontWeight: FontWeight.w700,
                color: Colors.white,
                fontSize: 36
            ),

            ),
           const SizedBox(height: 16,),
            Expanded(child: GestureDetector(
              onTap: () {
                counter++;
                angle-=7;
                if(counter ==34) {
                  counter=0;
                  index++;
                  if(index==3) index=0;

                }
                setState(() {

                });
              },
              child: Column(
                children: [
                  Image.asset(AssetsManager.sebha1),
                  Expanded(
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Transform.rotate(

                            angle: angle,
                            child: Image.asset(AssetsManager.sebhaBody)),
                         Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                              Text(list[index] , style: const TextStyle(
                              fontFamily: 'Janna',
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                               fontSize: 36
                            ),),
                            const SizedBox(height: 15,),
                            Text(counter.toString() , style:const TextStyle(
                              fontFamily: 'Janna',
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              fontSize: 36
                            ),),

                          ],
                        )
                      ],
                    ),
                  ),
                ],

              ),
            ),),
          ],
        ),
      ),
    );
  }
}

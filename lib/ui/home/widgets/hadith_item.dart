import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic13/model/hadithModel.dart';
import 'package:islamic13/ui/HadithDetails/hadithDetails.dart';

import '../../../style/assets_manager.dart';
import '../../../style/colors_manager.dart';

class HadithItem extends StatefulWidget {
  HadithModel hadithModel;

  HadithItem({super.key, required this.hadithModel });

  @override
  State<HadithItem> createState() => _HadithItemState();


}

class _HadithItemState extends State<HadithItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
         Navigator.of(context).pushNamed(HadithDetails.routeName , arguments:widget.hadithModel );

      },
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ColorsManager.primary
        ),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 20,left: 20,top: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child: Image.asset(AssetsManager.rightCorner, color:ColorsManager.secondary ,)),
                        Text(widget.hadithModel.title , style:const TextStyle(color: ColorsManager.secondary ,
                            fontFamily: 'Janna' ,
                            fontWeight: FontWeight.w700,
                            fontSize: 20
                        ),),
                        Expanded(child: Image.asset(AssetsManager.leftCorner, color: ColorsManager.secondary,)),
                      ],
                    ),
                    Expanded(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset('assets/images/HadithCard.png'),
                          Text(widget.hadithModel.body, textDirection: TextDirection.rtl,

                            maxLines: 9,
                            textAlign: TextAlign.center,
                            style:const TextStyle(color: ColorsManager.secondary ,
                                height: 2,
                                fontFamily: 'Janna' ,
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                              overflow: TextOverflow.ellipsis,

                            ),),
                        ],
                      ),
                    ),



                  ],
                ),
              ),
            ),
            Image.asset(AssetsManager.mosque),
          ]

        ),
      ),
    );

  }



}

import 'package:flutter/material.dart';
import 'package:islamic13/api/api_manager.dart';
import 'package:islamic13/model/Reciters.dart';
import 'package:islamic13/ui/home/widgets/radioItem.dart';

import '../../../style/assets_manager.dart';
import '../../../style/colors_manager.dart';

class RadioTab extends StatefulWidget {
  const RadioTab({super.key});

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {

  @override

  Widget build(BuildContext context) {
    return SafeArea(
      child:GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(AssetsManager.radioBack),
                  fit: BoxFit.fill)),
          child: Column(
            children: [
              Image.asset(AssetsManager.logo),
              Expanded(
                child: FutureBuilder<Reciters>(
                  future: ApiManager.getSources(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator(color: ColorsManager.primary,));
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else {
                      List recticers = snapshot.data?.radios??[];
                      return ListView.separated(
                        itemCount: recticers.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 8),
                        itemBuilder: (context, index) {

                          return RadioItem(radios: recticers[index]);
                        },
                      );
                    }
                  },
                ),
              )


            ],
          ),
        ),
      ),
    );

  }
}

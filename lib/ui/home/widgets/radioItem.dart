import 'package:flutter/material.dart';

import 'package:islamic13/style/assets_manager.dart';
import 'package:islamic13/style/colors_manager.dart';
import 'package:just_audio/just_audio.dart';

import '../../../model/Radios.dart';

class RadioItem extends StatefulWidget {
  final Radios radios ;
   const RadioItem({super.key , required this.radios});

  @override
  State<RadioItem> createState() => _RadioItemState();
}


class _RadioItemState extends State<RadioItem> {
  late AudioPlayer audioPlayer;
  bool isPlaying = true;
  double volume =1;

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
    audioPlayer.setUrl(widget.radios.url ?? '');
    audioPlayer.setVolume(volume);
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;


    return Container(
      margin:const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      height:height*.20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: ColorsManager.primary,
        image: const DecorationImage(
          alignment: Alignment.bottomCenter,
          image: AssetImage(AssetsManager.mosque),),

      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
           Text(widget.radios.name??'', style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            fontFamily: 'Janna',
            color: ColorsManager.secondary
          ),),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(onPressed: togglePlay,

                icon: Icon(
                  isPlaying ?Icons.play_arrow : Icons.pause ,
                  color: ColorsManager.secondary,
                  size: 50,
                ),
              ),
              Slider(
                value: volume,
                onChanged: (val) {
                  setState(() {
                    volume = val;
                  });
                  audioPlayer.setVolume(volume);
                },
                min: 0,
                max: 1,
                activeColor: ColorsManager.secondary,
                inactiveColor: Colors.grey[400],
              ),
              const Icon(Icons.volume_up, color: ColorsManager.secondary),
            ],
          ),
          const SizedBox(width: 15,)

        ],
      ),
    );
  }


  Future<void> togglePlay() async {
    try {
      setState(() {
        isPlaying = !isPlaying;
      });
      if (isPlaying) {

        await audioPlayer.pause();
      } else {
        await audioPlayer.play();
      }

    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Center(child: Text('Failed'))),
      );
    }
  }
}

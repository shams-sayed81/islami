import 'package:flutter/material.dart';

import '../../../style/assets_manager.dart';

class SebhaTab extends StatelessWidget {
  const SebhaTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(AssetsManager.sebhaBack) , fit: BoxFit.fill)
      ),
    );
  }
}

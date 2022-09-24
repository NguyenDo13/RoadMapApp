import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:road_map_flutter/presentation/UIData/images_animations.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 100,
        child: Lottie.asset(JSON_SPINNER),
      ),
    );
  }
}

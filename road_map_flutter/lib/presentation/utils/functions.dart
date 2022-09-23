// ignore_for_file: non_constant_identifier_names, constant_identifier_names
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:road_map_flutter/presentation/UIData/app_content.dart';
import 'package:road_map_flutter/presentation/UIData/images_animations.dart';
import 'package:road_map_flutter/presentation/widgets/alert_dialog.dart';
import 'package:road_map_flutter/data/models/road_map.dart';
import 'package:road_map_flutter/data/models/step_road_map.dart';

//* To return different height for different widgets
double getMinHeight(int index) {
  switch (index % 4) {
    case 0:
      return 50;
    case 1:
      return 75;
    case 2:
      return 75;
    case 3:
      return 50;
    default:
      return 50;
  }
}

void showDialogExtend(BuildContext context) {
  showAnimatedDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return const AlertDialogExtend();
    },
    animationType: DialogTransitionType.scale,
    curve: Curves.fastOutSlowIn,
    duration: const Duration(seconds: 1),
  );
}

List<Step> NoDataUI() {
  return [
    const Step(
      title: Text(MESS_NO_DATA),
      content: Text(MESS_NO_DATA),
    ),
  ];
}

List<StepRoadMap> getListStepRoadMap(List<RoadMap> listRoadMap) {
  int indexOfStep = -1;
  String subTitle = '';
  List<StepRoadMap> listStepRoadMap = [];

  for (var roadMap in listRoadMap) {
    subTitle = roadMap.title;
    for (var item in roadMap.steps) {
      indexOfStep++;
      var stepRoadMap = StepRoadMap(
        title: item.title,
        subTitle: subTitle,
        topics: item.topics,
        index: indexOfStep,
      );
      listStepRoadMap.add(stepRoadMap);
    }
  }

  if (listStepRoadMap.isNotEmpty) {
    return listStepRoadMap;
  } else {
    return [];
  }
}

Future<List<RoadMap>> loadData() async {
  final response = await rootBundle.loadString(JSON_DATA);
  log(response);
  List<RoadMap> roadMap = roadMapFromJson(response);

  if (roadMap.isNotEmpty) {
    return roadMap;
  } else {
    return [];
  }
}

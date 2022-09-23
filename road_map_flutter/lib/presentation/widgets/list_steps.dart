import 'package:flutter/material.dart';
import 'package:road_map_flutter/presentation/widgets/list_box.dart';
import 'package:road_map_flutter/presentation/UIData/colors.dart';
import 'package:road_map_flutter/presentation/utils/functions.dart';
import 'package:road_map_flutter/data/models/step_road_map.dart';

List<Step> buildSteps(List<StepRoadMap> listStepRoadMap) {
  List<Step> listSteps = [];

  listSteps = listStepRoadMap.map((item) {
    return Step(
      state: StepState.indexed,
      isActive: true,
      title: Text(item.title),
      subtitle: Text(
        item.subTitle!,
        style: const TextStyle(
          fontSize: 13,
          color: lightRedColor,
        ),
      ),
      content: ListBox(
        topics: item.topics,
      ),
    );
  }).toList();

  if (listSteps.isNotEmpty) {
    return listSteps;
  } else {
    return NoDataUI();
  }
}

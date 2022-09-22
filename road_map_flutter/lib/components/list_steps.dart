import 'package:flutter/material.dart';
import 'package:road_map_flutter/components/list_box.dart';
import 'package:road_map_flutter/road_map/models/road_map.dart';
import 'package:road_map_flutter/road_map/res/colors.dart';
import 'package:road_map_flutter/utils/functions_utils.dart';

List<Step> buildSteps(List<RoadMap> roadMap) {
  List<Step> listSteps = [];
  for (var item in roadMap) {
    var subTitle = item.title;
    final List<Step> listStepItem = item.steps.map((step) {
      return Step(
        state: StepState.indexed,
        isActive: true,
        title: Text(step.title),
        subtitle: Text(
          subTitle,
          style: const TextStyle(
            fontSize: 13,
            color: lightRedColor,
          ),
        ),
        content: ListBox(
          topics: step.topics,
        ),
      );
    }).toList();
    listSteps.addAll(listStepItem);
  }

  if (listSteps.isNotEmpty) {
    return listSteps;
  } else {
    return NoDataUI();
  }
}



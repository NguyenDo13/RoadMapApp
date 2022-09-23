import 'package:flutter/material.dart';
import 'package:road_map_flutter/app/components/list_box.dart';
import 'package:road_map_flutter/app/UIData/colors.dart';
import 'package:road_map_flutter/data/models/road_map.dart';
import 'package:road_map_flutter/app/utils/functions.dart';

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



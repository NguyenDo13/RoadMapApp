// ignore_for_file: non_constant_identifier_names, constant_identifier_names
import 'package:flutter/material.dart';
import 'package:road_map_flutter/app/UIData/app_content.dart';

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



List<Step> NoDataUI() {
  return [
    const Step(
      title: Text(MESS_NO_DATA),
      content: Text(MESS_NO_DATA),
    ),
  ];
}



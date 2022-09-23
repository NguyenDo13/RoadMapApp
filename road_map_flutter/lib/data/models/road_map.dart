// To parse this JSON data, do
//
//     final roadMap = roadMapFromJson(jsonString);

import 'package:road_map_flutter/data/models/step_road_map.dart';
import 'dart:convert';

List<RoadMap> roadMapFromJson(String str) =>
    List<RoadMap>.from(json.decode(str).map((x) => RoadMap.fromJson(x)));

String roadMapToJson(List<RoadMap> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RoadMap {
  RoadMap({
    required this.title,
    required this.steps,
  });
  String title;
  List<StepRoadMap> steps;

  factory RoadMap.fromJson(Map<String, dynamic> json) => RoadMap(
        title: json["title"],
        steps: List<StepRoadMap>.from(
            json["steps"].map((x) => StepRoadMap.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "steps": List<dynamic>.from(steps.map((x) => x.toJson())),
      };
}

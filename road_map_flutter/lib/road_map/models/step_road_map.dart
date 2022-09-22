import 'package:road_map_flutter/road_map/models/topics.dart';

class StepRoadMap {
  String title;
  List<Topics> topics;
  StepRoadMap({
    required this.title,
    required this.topics,
  });

  factory StepRoadMap.fromJson(Map<String, dynamic> json) => StepRoadMap(
        title: json["title"],
        topics: List<Topics>.from(
            json["list_topics"].map((x) => Topics.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "list_topics": List<dynamic>.from(topics.map((x) => x.toJson())),
      };
}

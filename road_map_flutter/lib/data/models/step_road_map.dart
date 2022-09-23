import 'package:road_map_flutter/data/models/topics.dart';

class StepRoadMap {
  String title;
  String? subTitle;
  bool? isCompleted = false;
  List<Topics> topics;
  int? index;
  StepRoadMap({
    required this.title,
    this.subTitle,
    required this.topics,
    this.index,
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

import 'package:flutter/material.dart';
import 'package:road_map_flutter/app/UIData/app_content.dart';
import 'package:road_map_flutter/app/pages/road_map/road_map_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: TITLE_ROADMAP,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        scaffoldBackgroundColor: Colors.lightBlue.shade50,
        brightness: Brightness.light,
      ),
      home: const RoadMapScreen(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:road_map_flutter/presentation/pages/road_map/road_map_screen.dart';
import 'package:road_map_flutter/presentation/services/stepper_bloc/stepper_bloc.dart';
import 'package:road_map_flutter/presentation/services/stepper_bloc/stepper_event.dart';
import 'package:road_map_flutter/presentation/utils/functions.dart';
import 'package:road_map_flutter/data/models/road_map.dart';

class RoadMapPage extends StatelessWidget {
  const RoadMapPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<RoadMap> roadmaps = [];
    loadData().then((value) {
      roadmaps = value;
    });
    return BlocProvider<StepperBloc>(
      create: (_) => StepperBloc()
        ..add(LoadStepperEvent(
            currentIndex: 2, listStepRoadMap: getListStepRoadMap(roadmaps))),
      child: const RoadMapScreen(),
    );
  }
}

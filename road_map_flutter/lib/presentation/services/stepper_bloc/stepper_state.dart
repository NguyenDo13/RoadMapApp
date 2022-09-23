import 'package:road_map_flutter/data/models/step_road_map.dart';

abstract class StepperState {
  const StepperState();
}

class StepperLoading extends StepperState {
  final bool isLoading;
  const StepperLoading({
    required this.isLoading,
  });
}

class StepperLoaded extends StepperState {
  final List<StepRoadMap> stepperRoadMap;
  final int currentIndex;
  const StepperLoaded({
    this.stepperRoadMap = const <StepRoadMap>[],
    required this.currentIndex,
  });
}

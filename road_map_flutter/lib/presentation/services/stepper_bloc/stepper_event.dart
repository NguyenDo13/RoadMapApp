import 'package:equatable/equatable.dart';

import 'package:road_map_flutter/data/models/step_road_map.dart';

abstract class StepperEvent extends Equatable {
  const StepperEvent();

  @override
  List<Object> get props => [];
}

class LoadStepperEvent extends StepperEvent {
  final int currentIndex;
  const LoadStepperEvent({
    required this.currentIndex,
  });
}

class StepCancleEvent extends StepperEvent {
  final int currentIndex;
  const StepCancleEvent({
    required this.currentIndex,
  });
}

class StepContinueEvent extends StepperEvent {
  final int currentIndex;
  const StepContinueEvent({
    required this.currentIndex,
  });
}

class StepTapEvent extends StepperEvent {
  final int indexStep;
  const StepTapEvent({
    required this.indexStep,
  });
}

class StepCompletedEvent extends StepperEvent {
  final StepRoadMap item;
  const StepCompletedEvent({
    required this.item,
  });
}

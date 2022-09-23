abstract class StepperEvent {}

class TapStepEvent extends StepperEvent {
  final int newIndex;
  TapStepEvent({
    required this.newIndex,
  });
}

class CancleStepEvent extends StepperEvent {}

class ContinueStepEvent extends StepperEvent {
  final int maxIndex;
  ContinueStepEvent({
    required this.maxIndex,
  });
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:road_map_flutter/app/services/stepper_bloc/stepper_state.dart';
import 'package:road_map_flutter/app/services/login_bloc/stepper_bloc/stepper_event.dart';

class StepperBloc extends Bloc<StepperEvent, IndexStepper> {
  IndexStepper _indexStepper;

  IndexStepper get indexStepper => _indexStepper;
  int get currentIndex => _indexStepper.currentIndex;
  int get completedIndex => _indexStepper.completedIndex;

  StepperBloc(this._indexStepper)
      : super(IndexStepper(currentIndex: 1, completedIndex: 1)) {
    on<TapStepEvent>((event, emit) {
      _indexStepper.currentIndex = event.newIndex;
      emit(_indexStepper);
    });
    on<CancleStepEvent>((event, emit) {
      if (_indexStepper.currentIndex > 0) {
        _indexStepper.currentIndex = _indexStepper.currentIndex - 1;
      }
      emit(_indexStepper);
    });
    on<ContinueStepEvent>((event, emit) {
      if (_indexStepper.currentIndex < event.maxIndex) {
        _indexStepper.currentIndex = _indexStepper.currentIndex + 1;
      }
      emit(_indexStepper);
    });
  }
}

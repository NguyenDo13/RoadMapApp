import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:road_map_flutter/presentation/services/stepper_bloc/stepper_event.dart';
import 'package:road_map_flutter/presentation/services/stepper_bloc/stepper_state.dart';
import 'package:road_map_flutter/presentation/utils/functions.dart';

class StepperBloc extends Bloc<StepperEvent, StepperState> {
  StepperBloc() : super(StepperLoading()) {
    on<LoadStepperEvent>(_loadStepper);
    on<StepCancleEvent>(_cancleStep);
    on<StepContinueEvent>(_continueStep);
    on<StepTapEvent>(_tapStep);
  }

  Future<void> _loadStepper(
    LoadStepperEvent event,
    Emitter<StepperState> emit,
  ) async {
    emit(StepperLoading());
    final roadMaps = await loadData();
    final stepperRoadMap = getListStepRoadMap(roadMaps);
    
    if (stepperRoadMap.isNotEmpty) {
      emit(
        StepperLoaded(
          currentIndex: event.currentIndex,
          stepperRoadMap: stepperRoadMap,
        ),
      );
    }
  }

  void _cancleStep(StepCancleEvent event, Emitter<StepperState> emit) {
    final state = this.state;
    if (state is StepperLoaded) {
      if (event.currentIndex > 0) {
        emit(
          StepperLoaded(
            currentIndex: event.currentIndex - 1,
            stepperRoadMap: state.stepperRoadMap,
          ),
        );
      }
    }
  }

  void _continueStep(StepContinueEvent event, Emitter<StepperState> emit) {
    final state = this.state;
    if (state is StepperLoaded) {
      if (event.currentIndex < state.stepperRoadMap.last.index!) {
        emit(
          StepperLoaded(
            currentIndex: event.currentIndex + 1,
            stepperRoadMap: state.stepperRoadMap,
          ),
        );
      }
    }
  }

  void _tapStep(StepTapEvent event, Emitter<StepperState> emit) {
    final state = this.state;
    if (state is StepperLoaded) {
      emit(
        StepperLoaded(
          currentIndex: event.indexStep,
          stepperRoadMap: state.stepperRoadMap,
        ),
      );
    }
  }
}

import 'package:equatable/equatable.dart';
import 'package:road_map_flutter/app/services/login_bloc/stepper_bloc/step_item.dart';
part of 'stepper_bloc.dart';

abstract class StepperState extends Equatable {
  const StepperState();

  @override
  List<Object> get props => [];
}

class StepperLoading extends StepperState {}

class StepperLoaded extends StepperState {
  final List<StepItem> stepperRoadMap;
  const StepperLoaded({
    this.stepperRoadMap = const <StepItem>[],
  });

  @override
  List<Object> get props => [];
}

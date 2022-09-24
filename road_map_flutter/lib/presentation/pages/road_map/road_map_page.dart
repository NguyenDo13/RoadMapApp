import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:road_map_flutter/presentation/pages/road_map/road_map_screen.dart';
import 'package:road_map_flutter/presentation/services/stepper_bloc/stepper_bloc.dart';
import 'package:road_map_flutter/presentation/services/stepper_bloc/stepper_event.dart';

class RoadMapPage extends StatelessWidget {
  const RoadMapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<StepperBloc>(
      create: (_) => StepperBloc()
        ..add(
          const LoadStepperEvent(
            currentIndex: 2,
          ),
        ),
      child: const RoadMapScreen(),
    );
  }
}

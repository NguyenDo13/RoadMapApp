import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:road_map_flutter/presentation/widgets/list_steps.dart';
import 'package:road_map_flutter/presentation/UIData/app_content.dart';
import 'package:road_map_flutter/presentation/UIData/colors.dart';
import 'package:road_map_flutter/presentation/services/stepper_bloc/stepper_bloc.dart';
import 'package:road_map_flutter/presentation/services/stepper_bloc/stepper_event.dart';
import 'package:road_map_flutter/presentation/services/stepper_bloc/stepper_state.dart';
import 'package:road_map_flutter/presentation/utils/functions.dart';
import 'package:road_map_flutter/presentation/UIData/images_animations.dart';
import 'package:road_map_flutter/presentation/widgets/loading_widget.dart';
import 'package:road_map_flutter/presentation/widgets/state_login_widget.dart';

class RoadMapScreen extends StatefulWidget {
  const RoadMapScreen({super.key});

  @override
  State<RoadMapScreen> createState() => _RoadMapScreenState();
}

class _RoadMapScreenState extends State<RoadMapScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarRoadMap(context),
      body: _buildRoadMap(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialogExtend(context),
        backgroundColor: lightBlueColorF7,
        child: Center(
          child: SizedBox(
            height: 48,
            child: Lottie.asset(JSON_QUESTION),
          ),
        ),
      ),
    );
  }

  AppBar _appBarRoadMap(BuildContext context) {
    return AppBar(
      toolbarHeight: 80,
      backgroundColor: lightBlueColorF6,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(16),
        ),
      ),
      title: const Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
        child: Text(
          TITLE_ROADMAP,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      actions: const [
        StateLoginWidget(),
        SizedBox(
          width: 12,
        ),
      ],
    );
  }

  Widget _buildRoadMap() {
    return BlocBuilder<StepperBloc, StepperState>(
      builder: (context, state) {
        if (state is StepperLoading) {
          return const LoadingWidget();
        }

        if (state is StepperLoaded) {
          return Stepper(
            currentStep: state.currentIndex,
            onStepCancel: () => _onStepCancel(state.currentIndex),
            onStepContinue: () => _onStepContinue(state.currentIndex),
            onStepTapped: (int stepIndex) => _onStepTapped(stepIndex),
            steps: buildSteps(state.stepperRoadMap),
          );
        }
        
        return const Center(
            child: Text(
          'Some thing Wrong! 😭😭',
          style: TextStyle(color: Colors.red),
        ));
      },
    );
  }

  _onStepCancel(index) {
    context.read<StepperBloc>().add(
          StepCancleEvent(
            currentIndex: index,
          ),
        );
  }

  _onStepContinue(index) {
    context.read<StepperBloc>().add(
          StepContinueEvent(
            currentIndex: index,
          ),
        );
  }

  _onStepTapped(index) {
    context.read<StepperBloc>().add(
          StepTapEvent(
            indexStep: index,
          ),
        );
  }
}

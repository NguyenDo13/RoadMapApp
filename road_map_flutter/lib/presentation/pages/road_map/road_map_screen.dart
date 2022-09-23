import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:road_map_flutter/presentation/widgets/list_steps.dart';
import 'package:road_map_flutter/presentation/pages/login/login_screen.dart';
import 'package:road_map_flutter/presentation/UIData/app_content.dart';
import 'package:road_map_flutter/presentation/UIData/colors.dart';
import 'package:road_map_flutter/presentation/services/stepper_bloc/stepper_bloc.dart';
import 'package:road_map_flutter/presentation/services/stepper_bloc/stepper_event.dart';
import 'package:road_map_flutter/presentation/services/stepper_bloc/stepper_state.dart';
import 'package:road_map_flutter/presentation/utils/functions.dart';
import 'package:road_map_flutter/presentation/UIData/images_animations.dart';

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
      actions: [
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginScreen(),
              ),
            );
          },
          child: Center(
            child: Row(
              children: [
                SizedBox(
                  height: 58,
                  child: Lottie.network(
                    'https://assets8.lottiefiles.com/private_files/lf30_bcVsEA.json',
                  ),
                ),
                const Text(
                  TITLE_LOGIN,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
      ],
    );
  }

  Widget _buildRoadMap() {
    return BlocBuilder<StepperBloc, StepperState>(
      builder: (context, state) {
        if (state is StepperLoading) {
          return Center(
            child: SizedBox(
              height: 100,
              child: Lottie.asset(JSON_SPINNER),
            ),
          );
        }
        if (state is StepperLoaded) {
          return Stepper(
            currentStep: state.currentIndex,
            onStepCancel: () {
              context.read<StepperBloc>().add(StepCancleEvent(currentIndex: state.currentIndex));
            },
            onStepContinue: () {
              context.read<StepperBloc>().add(StepContinueEvent(currentIndex: state.currentIndex));
            },
            onStepTapped: (int stepIndex) {
              context.read<StepperBloc>().add(
                    StepTapEvent(indexStep: stepIndex),
                  );
            },
            steps: buildSteps(state.stepperRoadMap),
          );
        } else {
          return const Text('no have data!');
        }
      },
    );
  }
}

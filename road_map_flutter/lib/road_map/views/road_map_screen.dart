import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:lottie/lottie.dart';
import 'package:road_map_flutter/components/alert_dialog.dart';
import 'package:road_map_flutter/components/list_steps.dart';
import 'package:road_map_flutter/login_screen.dart';
import 'package:road_map_flutter/road_map/models/road_map.dart';
import 'package:road_map_flutter/road_map/res/app_content.dart';
import 'package:road_map_flutter/road_map/res/colors.dart';
import 'package:road_map_flutter/utils/constants.dart';

class RoadMapScreen extends StatefulWidget {
  const RoadMapScreen({super.key});

  @override
  State<RoadMapScreen> createState() => _RoadMapScreenState();
}

class _RoadMapScreenState extends State<RoadMapScreen> {
  late int _indexStepper;
  bool _isLoading = true;
  String? _response;
  List<RoadMap> _roadMap = [];

  @override
  void initState() {
    _indexStepper = 0;
    _loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
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
            child: const Center(
              child: Text(
                TITLE_LOGIN,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
        ],
      ),
      body: _isLoading
          ? Center(
              child: SizedBox(
                height: 100,
                child: Lottie.asset(JSON_SPINNER),
              ),
            )
          : _buildRoadMap(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialogExtend(context),
        backgroundColor: lightBlueColor100,
        child: Center(
          child: SizedBox(
            height: 48,
            child: Lottie.asset(JSON_QUESTION),
          ),
        ),
      ),
    );
  }

  void showDialogExtend(BuildContext context) {
    showAnimatedDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return const AlertDialogExtend();
      },
      animationType: DialogTransitionType.scale,
      curve: Curves.fastOutSlowIn,
      duration: const Duration(seconds: 1),
    );
  }

  Widget _buildRoadMap() {
    return Stepper(
      currentStep: _indexStepper,
      onStepCancel: () => _onStepCancel(),
      onStepContinue: () => _onStepContinue(),
      onStepTapped: (int tepsIndex) => _onStepTapped(tepsIndex),
      steps: buildSteps(_roadMap),
    );
  }

  Future _loadData() async {
    _response = await rootBundle.loadString(JSON_DATA);
    _roadMap = roadMapFromJson(_response!);

    if (_roadMap.isNotEmpty) {
      setState(() {
        _isLoading = false;
      });
    } else {
      setState(() {
        _isLoading = true;
      });
    }
  }

  void _onStepTapped(tepsIndex) {
    setState(() {
      _indexStepper = tepsIndex;
    });
  }

  void _onStepCancel() {
    if (_indexStepper > 0) {
      setState(() {
        _indexStepper -= 1;
      });
    }
  }

  void _onStepContinue() {
    setState(() {
      _indexStepper += 1;
    });
  }
}

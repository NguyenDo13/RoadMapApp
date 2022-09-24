import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:road_map_flutter/data/environment.dart';
import 'package:road_map_flutter/data/repository/auth_repository.dart';
import 'package:road_map_flutter/presentation/UIData/app_content.dart';
import 'package:road_map_flutter/presentation/pages/road_map/road_map_page.dart';
import 'package:road_map_flutter/presentation/services/login_bloc/login_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (_) => LoginBloc(
        AuthRepository(
          e: Environment(isServerDev: true),
        ),
      ),
      child: MaterialApp(
        title: TITLE_ROADMAP,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.lightBlue,
          scaffoldBackgroundColor: Colors.lightBlue.shade50,
          brightness: Brightness.light,
        ),
        home: const RoadMapPage(),
      ),
    );
  }
}

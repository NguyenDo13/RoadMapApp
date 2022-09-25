import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:road_map_flutter/data/environment.dart';
import 'package:road_map_flutter/data/repository/auth_repository.dart';
import 'package:road_map_flutter/presentation/UIData/app_content.dart';
import 'package:road_map_flutter/presentation/pages/road_map/road_map_page.dart';
import 'package:road_map_flutter/presentation/services/login_bloc/login_bloc.dart';
import 'package:road_map_flutter/presentation/services/login_bloc/login_event.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<SharedPreferences> shared;
  initshared() async {
    shared = SharedPreferences.getInstance();
  }

  @override
  void initState() {
      initshared();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (_) => LoginBloc(
        AuthRepository(
          e: Environment(isServerDev: true),
        ),
        shared,
      )..add(LoginWithAccessToken()),
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

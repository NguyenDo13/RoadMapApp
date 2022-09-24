import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:road_map_flutter/presentation/UIData/app_content.dart';
import 'package:road_map_flutter/presentation/services/login_bloc/login_bloc.dart';
import 'package:road_map_flutter/presentation/services/login_bloc/login_event.dart';
import 'package:road_map_flutter/presentation/services/login_bloc/login_state.dart';
import 'package:road_map_flutter/presentation/utils/functions.dart';

class StateLoginWidget extends StatelessWidget {
  const StateLoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        if (state is LoginInitial || state is LogoutState) {
          return InkWell(
            onTap: () => navigateToLogin(context),
            child: const Center(
              child: Text(
                TITLE_LOGIN,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        }
        if (state is LoggedState) {
          return InkWell(
            onTap: () {
              context.read<LoginBloc>().add(LogoutEvent());
            },
            child: Center(
              child: SizedBox(
                height: 58,
                child: Lottie.network(
                  'https://assets8.lottiefiles.com/private_files/lf30_bcVsEA.json',
                ),
              ),
            ),
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
}

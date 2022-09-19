import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yoko_test/main/domain/blocs/activity/activity_bloc.dart';
import 'package:yoko_test/main/presentation/screens/activities/activities_screen.dart';

class AppRouter {
  static void back(BuildContext context) {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
    return;
  }

  static toMainScreen(BuildContext context) {
    final route = MaterialPageRoute(
      builder: (_) => BlocProvider<ActivityBloc>(
        create: (_) => ActivityBloc(),
        child: const ActivitiesScreen(),
      ),
    );
    Navigator.of(context).push(route);
  }
}

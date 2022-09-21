import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yoko_test/main/domain/blocs/activity/activity_bloc.dart';
import 'package:yoko_test/main/domain/models/activity.dart';
import 'package:yoko_test/main/presentation/screens/activities/activities_screen.dart';
import 'package:yoko_test/main/presentation/screens/activities/activity_details_screen.dart';

class AppRouter {
  static void back(BuildContext context) {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
    return;
  }

  static toMainScreen(BuildContext context) {
    final newRoute = MaterialPageRoute(
      builder: (_) => BlocProvider<ActivityBloc>(
        create: (_) => ActivityBloc(),
        child: const ActivitiesScreen(),
      ),
    );
    Navigator.of(context).popUntil((route) => route.isFirst);
    Navigator.of(context).pushReplacement(newRoute);
  }

  static void toActivityDetailsScreen({required BuildContext context, required Activity activity}) {
    final route = MaterialPageRoute(builder: (_) => ActivityDetailsScreen(activity: activity));
    Navigator.of(context).push(route);
  }
}

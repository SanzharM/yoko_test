import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yoko_test/core/storage/local_storage.dart';
import 'package:yoko_test/main/domain/blocs/activity/activity_bloc.dart';
import 'package:yoko_test/main/domain/blocs/authorization/authorization_bloc.dart';
import 'package:yoko_test/main/presentation/screens/activities/activities_screen.dart';
import 'package:yoko_test/main/presentation/screens/authorization/login_screen.dart';
import 'package:yoko_test/main/presentation/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  Widget screen = BlocProvider<AuthorizationBloc>(
    create: (_) => AuthorizationBloc(),
    child: const LoginScreen(),
  );

  if (await LocalStorage().getAccessToken() != null) {
    screen = BlocProvider<ActivityBloc>(
      create: (_) => ActivityBloc(),
      child: const ActivitiesScreen(),
    );
  }

  runApp(App(screen: screen));
}

class App extends StatelessWidget {
  const App({Key? key, required this.screen}) : super(key: key);

  final Widget screen;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yoko test',
      debugShowCheckedModeBanner: false,
      theme: AppTheme().defaultTheme,
      home: screen,
    );
  }
}

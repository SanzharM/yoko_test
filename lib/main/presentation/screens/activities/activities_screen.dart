import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yoko_test/core/constants/constants.dart';
import 'package:yoko_test/main/domain/blocs/activity/activity_bloc.dart';
import 'package:yoko_test/main/domain/models/activity.dart';
import 'package:yoko_test/main/presentation/screens/activities/activity_card.dart';
import 'package:yoko_test/main/presentation/widgets/custom_app_bar.dart';
import 'package:yoko_test/main/presentation/widgets/custom_shimmer.dart';

class ActivitiesScreen extends StatefulWidget {
  const ActivitiesScreen({Key? key}) : super(key: key);

  @override
  State<ActivitiesScreen> createState() => _ActivitiesScreenState();
}

class _ActivitiesScreenState extends State<ActivitiesScreen> {
  late ActivityBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = context.read<ActivityBloc>()..getActivities();
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Активности',
      ),
      body: BlocConsumer<ActivityBloc, ActivityState>(
        bloc: bloc,
        listener: (_, state) {
          debugPrint('state is $state');
        },
        builder: (_, state) {
          return CustomShimmer(
            isLoading: state is ActivitiesLoadingState,
            child: RefreshIndicator(
              color: AppColors.blueGradient1,
              onRefresh: () async => bloc.getActivities(),
              child: CupertinoScrollbar(
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(AppConstraints.padding),
                  shrinkWrap: true,
                  itemCount: state is ActivitiesLoadedState ? state.activities.length : 3,
                  separatorBuilder: (_, sep) => const SizedBox(height: AppConstraints.padding),
                  itemBuilder: (_, i) => ActivityCard(
                    activity: state is ActivitiesLoadedState ? state.activities[i] : const Activity(),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

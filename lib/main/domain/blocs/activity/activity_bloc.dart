import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:yoko_test/main/data/providers/activity/activity_provider.dart';

part 'activity_event.dart';
part 'activity_state.dart';

class ActivityBloc extends Bloc<ActivityEvent, ActivityState> {
  void getActivities() => add(GetActivitiesEvent());
  void addTariff() => debugPrint('handle action in bloc');

  ActivityBloc() : super(ActivityInitial()) {
    on<GetActivitiesEvent>(_getActivities);
  }

  final _provider = ActivityProvider();

  void _getActivities(GetActivitiesEvent event, Emitter<ActivityState> emit) async {
    emit(ActivitiesLoadingState());
    try {
      final response = await _provider.getActivities();
      if (response.isSuccess) {
        return emit(ActivitiesLoadedState(response.activities!));
      }
      emit(ActivitiesErrorState(response.error ?? 'Что-то пошло не так'));
    } catch (e) {
      debugPrint('ActivityBloc error: $e');
      emit(ActivitiesErrorState('Что-то пошло не так'));
    }
  }
}

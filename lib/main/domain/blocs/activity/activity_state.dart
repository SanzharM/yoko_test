part of 'activity_bloc.dart';

@immutable
abstract class ActivityState {}

class ActivityInitial extends ActivityState {}

class ActivitiesLoadingState extends ActivityState {}

class ActivitiesErrorState extends ActivityState {
  final String error;
  ActivitiesErrorState(this.error);
}

class ActivitiesLoadedState extends ActivityState {
  final List<dynamic> activities;
  ActivitiesLoadedState(this.activities);
}

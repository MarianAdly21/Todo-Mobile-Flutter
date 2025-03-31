part of 'home_screen_bloc.dart';

@immutable
sealed class HomeScreenState {}

final class HomeScreenInitialState extends HomeScreenState {}
class LoadedTasksSuccessState extends HomeScreenState {
  final List<TaskModel> tasks;

  LoadedTasksSuccessState({required this.tasks});
}

class FailuerState extends HomeScreenState {
  final String erorrMessage;

  FailuerState(this.erorrMessage);
}

class ConvertUiState extends HomeScreenState {
  final bool isGrid;

  ConvertUiState({required this.isGrid});
}

class ConvertThemeState extends HomeScreenState {
  final bool isDark;

  ConvertThemeState({required this.isDark});
}

class AddTaskSuccessfullyState extends HomeScreenState {}

class DeleteTaskSuccessfullyState extends HomeScreenState {}

class DoneTaskSuccessfullyState extends HomeScreenState {}

class OpenSearchScreenSuccessfullyState extends HomeScreenState {}


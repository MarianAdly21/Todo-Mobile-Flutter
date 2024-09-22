import 'package:todo_mobile/features/home/models/task_model.dart';

abstract class TasksState {}

class InitialState extends TasksState {}

class LoadedTasksSuccessState extends TasksState {
  final List<TaskModel> tasks;

  LoadedTasksSuccessState({required this.tasks});
}

class FailuerState extends TasksState {
  final String erorrMessage;

  FailuerState(this.erorrMessage);
}

class ConvertUiState extends TasksState {
  final bool isGrid;

  ConvertUiState({required this.isGrid});
}

class SearchLoadedState extends TasksState {
  final List<TaskModel> tasksFounded;
  SearchLoadedState({required this.tasksFounded});
}

class ConvertThemeState extends TasksState {
  final bool isDark;

  ConvertThemeState({required this.isDark});
}

part of 'home_screen_bloc.dart';

@immutable
sealed class HomeScreenEvent {}

class LoadedTasksEvent extends HomeScreenEvent {}

class AddTaskEvent extends HomeScreenEvent {
  final TaskModel task;

  AddTaskEvent({required this.task});
}

class ConvertUIEvent extends HomeScreenEvent {}

class DoneTaskEvent extends HomeScreenEvent {
  final int index;
  final TaskModel task;
  bool isGrid = false;

  DoneTaskEvent({required this.index, required this.task});
}

class DeleteTaskEvent extends HomeScreenEvent {
  final TaskModel task;

  DeleteTaskEvent({required this.task});
}

class ConvertThemeEvent extends HomeScreenEvent {}

class OpenSearchScreenEvent extends HomeScreenEvent {
  final bool isDark;

  OpenSearchScreenEvent({required this.isDark});
}

class OpenBottomSheetEvent extends HomeScreenEvent {}

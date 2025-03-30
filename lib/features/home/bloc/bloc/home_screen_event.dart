part of 'home_screen_bloc.dart';

@immutable
sealed class HomeScreenEvent {}
class AddTaskEvent extends HomeScreenEvent {}

class ConvertUIEvent extends HomeScreenEvent {}

class DoneTaskEvent extends HomeScreenEvent {}

class DeleteTaskEvent extends HomeScreenEvent {}

class ConvertThemeEvent extends HomeScreenEvent {}

class OpenSearchScreenEvent extends HomeScreenEvent {}

class OpenBottomSheetEvent extends HomeScreenEvent {}


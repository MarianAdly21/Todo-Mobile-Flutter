part of 'search_screen_bloc.dart';

@immutable
sealed class SearchScreenState {}

final class SearchScreenInitialState extends SearchScreenState {}

class FailuerSearchState extends SearchScreenState {
  final String messageErorr;

  FailuerSearchState({required this.messageErorr});
}

class SearchLoadedState extends SearchScreenState {
  final List<TaskModel> tasksFounded;
  SearchLoadedState({required this.tasksFounded});
}
class DeleteFromSearchFormState extends SearchScreenState {}

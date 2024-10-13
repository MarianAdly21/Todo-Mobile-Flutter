import 'package:todo_mobile/features/home/models/task_model.dart';

abstract class SearchState {}

class InitialSearchState extends SearchState {}

class FailuerSearchState extends SearchState {
  final String messageErorr;

  FailuerSearchState({required this.messageErorr});
}
class SearchLoadedState extends SearchState {
  final List<TaskModel> tasksFounded;
  SearchLoadedState({required this.tasksFounded});
}

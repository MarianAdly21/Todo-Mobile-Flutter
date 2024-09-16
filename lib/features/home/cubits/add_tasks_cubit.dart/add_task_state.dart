abstract class AddTasksState {}

class AddTaskInitialState extends AddTasksState {}

class AddTasksLoadingState extends AddTasksState {}

class AddTasksSuccessState extends AddTasksState {}

class AddTaskFailuerState extends AddTasksState {
  final String erorrMessage;

  AddTaskFailuerState(this.erorrMessage);
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_mobile/features/home/cubits/tasks_cubit/tasks_state.dart';
import 'package:todo_mobile/features/home/models/task_model.dart';

class TasksCubit extends Cubit<TasksState> {
  TasksCubit() : super(InitialState());
  bool isGrid = false;
  List<TaskModel> tasks = [];
  bool isDark = false;
  void darktheme() {
    isDark = !isDark;
    emit(ConvertThemeState(isDark: isDark));
  }

  void changeUi() {
    isGrid = !isGrid;
    emit(ConvertUiState(isGrid: isGrid));
  }

  var taskBox = Hive.box<TaskModel>('taskBox');

  getTaskSearch(String titleSearch) {
    List<TaskModel> searchResultList = [];
    tasks = taskBox.values.toList();
    if (titleSearch.isNotEmpty) {
      for (int i = 0; i < tasks.length; i++) {
        if (tasks[i].title.contains(titleSearch)) {
          searchResultList.add(tasks[i]);
        }
      }
    }

    return emit(SearchLoadedState(tasksFounded: searchResultList));
  }

  getAllTasks() {
    try {
      tasks = taskBox.values.toList();
      emit(LoadedTasksSuccessState(tasks: tasks));
    } catch (e) {
      emit(FailuerState(e.toString()));
    }
  }

  addTasks(TaskModel task) async {
    try {
      var taskBox = Hive.box<TaskModel>('taskBox');
      await taskBox.add(task);
      emit(AddTasksSuccessState());
    } catch (e) {
      emit(FailuerState(e.toString()));
    }
  }

  deleteTask(TaskModel task) async {
    try {
      await task.delete();
      emit(DeleteTaskSuccessfullyState());
    } catch (e) {
      emit(FailuerState(e.toString()));
    }
  }
}

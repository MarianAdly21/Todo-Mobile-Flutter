import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_mobile/features/home/cubits/tasks_cubit/tasks_state.dart';
import 'package:todo_mobile/features/home/models/task_model.dart';

class TasksCubit extends Cubit<TasksState> {
  TasksCubit() : super(InitialState());
  bool isGrid = false;
  List<TaskModel> tasks=[];

  void changeUi() {
    isGrid = !isGrid;
    emit(ConvertUiState(isGrid: isGrid));
  }

  getAllTasks() {
    try {
      var taskBox = Hive.box<TaskModel>('taskBox');
        tasks=taskBox.values.toList();
      emit(LoadedTasksSuccessState(tasks:tasks ));
    } catch (e) {
      emit(FailuerState(e.toString()));
    }
  }
}

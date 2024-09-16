import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_mobile/features/home/cubits/add_tasks_cubit.dart/add_task_state.dart';
import 'package:todo_mobile/features/home/models/task_model.dart';

class AddTasksCubit extends Cubit<AddTasksState> {
  AddTasksCubit() : super(AddTaskInitialState());

  addTasks(TaskModel task) async {
    try {
      var taskBox = Hive.box<TaskModel>('noteBox');
      await taskBox.add(task);
      emit(AddTasksSuccessState());
    } catch (e) {
      emit(AddTaskFailuerState(e.toString()));
    }
  }
}

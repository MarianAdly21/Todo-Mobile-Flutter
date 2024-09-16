import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_mobile/features/home/cubits/add_tasks_cubit.dart/add_task_state.dart';

class AddTasksCubit extends Cubit<AddTasksState> {
  AddTasksCubit() : super(AddTaskInitialState());
}

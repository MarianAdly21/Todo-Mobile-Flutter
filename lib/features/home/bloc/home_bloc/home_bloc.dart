import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_mobile/features/home/bloc/home_bloc/tasks_event.dart';
import 'package:todo_mobile/features/home/cubits/tasks_cubit/tasks_state.dart';

class TaskBloc extends Bloc<HomeEvents, TasksState> {
  TaskBloc(super.initialState);
}

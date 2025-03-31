import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:todo_mobile/features/home/bloc/home_screen_bloc.dart';
import 'package:todo_mobile/features/home/models/task_model.dart';

part 'search_screen_event.dart';
part 'search_screen_state.dart';

class SearchScreenBloc extends Bloc<SearchScreenEvent, SearchScreenState> {
  SearchScreenBloc() : super(SearchScreenInitialState()) {
    on<GetTasksEvent>(_getTasksEvent);
    on<DeleteFromSearchFormEvent>(_deleteFromSearchFormEvent);
  }

  FutureOr<void> _getTasksEvent(
      GetTasksEvent event, Emitter<SearchScreenState> emit) {
    List<TaskModel> tasks = [];
    var taskBox = Hive.box<TaskModel>('taskBox');
    List<TaskModel> searchResultList = [];
    tasks = taskBox.values.toList();
    if (event.titleSearch.isNotEmpty) {
      for (int i = 0; i < tasks.length; i++) {
        if (tasks[i].title.contains(event.titleSearch)) {
          searchResultList.add(tasks[i]);
        }
      }
    }

    emit(SearchLoadedState(tasksFounded: searchResultList));
  }

  FutureOr<void> _deleteFromSearchFormEvent(
      DeleteFromSearchFormEvent event, Emitter<SearchScreenState> emit) {
    emit(DeleteFromSearchFormState());
  }
}

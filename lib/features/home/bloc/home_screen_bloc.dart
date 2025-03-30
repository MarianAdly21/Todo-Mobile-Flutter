import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:todo_mobile/features/home/models/task_model.dart';

part 'home_screen_event.dart';
part 'home_screen_state.dart';

var taskBox = Hive.box<TaskModel>('taskBox');
List<TaskModel> tasks = [];
bool isGrid = false;
bool isDark = false;

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  HomeScreenBloc() : super(HomeScreenInitialState()) {
    on<LoadedTasksEvent>(_loadedTasksEvent);
    on<AddTaskEvent>(_addTaskEvent);
    on<DeleteTaskEvent>(_deleteTaskEvent);
    on<DoneTaskEvent>(_doneTaskEvent);
    on<ConvertUIEvent>(_convertUiEvent);
    on<ConvertThemeEvent>(_convertThemEvent);
  }

  FutureOr<void> _loadedTasksEvent(
      LoadedTasksEvent event, Emitter<HomeScreenState> emit) {
    try {
      tasks = taskBox.values.toList();
      emit(LoadedTasksSuccessState(tasks: tasks));
    } catch (e) {
      emit(FailuerState(e.toString()));
    }
  }

  FutureOr<void> _addTaskEvent(
      AddTaskEvent event, Emitter<HomeScreenState> emit) async {
    try {
      // var taskBox = Hive.box<TaskModel>('taskBox');
      await taskBox.add(event.task);
      emit(AddTaskSuccessfullyState());
    } catch (e) {
      emit(FailuerState(e.toString()));
    }
  }

  FutureOr<void> _deleteTaskEvent(
      DeleteTaskEvent event, Emitter<HomeScreenState> emit) async {
    try {
      await event.task.delete();
      emit(DeleteTaskSuccessfullyState());
    } catch (e) {
      emit(FailuerState(e.toString()));
    }
  }

  FutureOr<void> _doneTaskEvent(
      DoneTaskEvent event, Emitter<HomeScreenState> emit) async {
    debugPrint("Befor Update ${event.task.isDone}");
    event.task.isDone = !event.task.isDone;
    await Hive.box<TaskModel>('taskBox').putAt(event.index, event.task);
    emit(DoneTaskSuccessfullyState());
    debugPrint("After Update ${event.task.isDone}");
  }

  FutureOr<void> _convertUiEvent(
      ConvertUIEvent event, Emitter<HomeScreenState> emit) {
    isGrid = !isGrid;
    emit(ConvertUiState(isGrid: isGrid));
  }

  FutureOr<void> _convertThemEvent(ConvertThemeEvent event, Emitter<HomeScreenState> emit) {
    isDark = !isDark;
    emit(ConvertThemeState(isDark: isDark));
  }
}

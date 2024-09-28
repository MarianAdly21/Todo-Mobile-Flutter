import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:todo_mobile/features/home/cubits/search_cubit/search_state.dart';
import 'package:todo_mobile/features/home/models/task_model.dart';

class SearchCubit extends Cubit<SearchState>{
  SearchCubit():super(InitialSearchState());

  List<TaskModel> tasks = [];
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

}
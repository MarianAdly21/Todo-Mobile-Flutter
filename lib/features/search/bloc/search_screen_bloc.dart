import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_mobile/features/home/models/task_model.dart';

part 'search_screen_event.dart';
part 'search_screen_state.dart';

class SearchScreenBloc extends Bloc<SearchScreenEvent, SearchScreenState> {
  SearchScreenBloc() : super(SearchScreenInitialState()) {
    on<SearchScreenEvent>((event, emit) {
     
    });
  }
}

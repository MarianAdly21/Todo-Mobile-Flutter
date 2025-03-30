import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_mobile/features/home/models/task_model.dart';

part 'home_screen_event.dart';
part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  HomeScreenBloc() : super(HomeScreenInitialState()) {
    on<HomeScreenEvent>((event, emit) {
      
    });
  }
}

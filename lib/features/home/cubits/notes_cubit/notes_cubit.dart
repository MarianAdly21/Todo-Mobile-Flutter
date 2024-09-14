
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_mobile/features/home/cubits/notes_cubit/notes_state.dart';

class NoteCubit extends Cubit<NotesState>{
  NoteCubit():super(InitialState());

}
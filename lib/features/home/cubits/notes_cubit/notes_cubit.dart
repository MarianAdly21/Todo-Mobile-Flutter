import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_mobile/features/home/cubits/notes_cubit/notes_state.dart';
import 'package:todo_mobile/features/home/models/note_model.dart';

class NoteCubit extends Cubit<NotesState> {
  NoteCubit() : super(InitialState());

  List<NoteModel> notes = [];
  getAllNotes() {
    try {
      var box = Hive.box<NoteModel>('noteBox');
      notes = box.values.toList();
      emit(SuccessState());
    } catch (e) {
      emit(FailuerState(e.toString()));
    }
  }
}

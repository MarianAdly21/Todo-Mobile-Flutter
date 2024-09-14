abstract class NotesState {}

class InitialState extends NotesState {}

class SuccessState extends NotesState {}

class FailuerState extends NotesState {
  final String erorrMessage;

  FailuerState(this.erorrMessage);

}

class ConvertUiState extends NotesState {}

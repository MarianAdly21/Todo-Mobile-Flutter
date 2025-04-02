import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:intl/intl.dart';

part 'localization_event.dart';
part 'localization_state.dart';

class LocalizationBloc extends Bloc<LocalizationEvent, LocalizationState> {
  LocalizationBloc() : super(LocalizationInitialstate()) {
    on<TapToChangeLanguageEvent>(_tapTOchangeLanguageEvent);
  }

  FutureOr<void> _tapTOchangeLanguageEvent(
      TapToChangeLanguageEvent event, Emitter<LocalizationState> emit) {
    String lang = Intl.getCurrentLocale();
    if (lang == "en") {
      lang = "ar";
    } else {
      lang = "en";
    }
    emit(ChangeLanguagestate(language: lang));
  }
}

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'localization_event.dart';
part 'localization_state.dart';

class LocalizationBloc extends Bloc<LocalizationEvent, LocalizationState> {
  LocalizationBloc() : super(LocalizationInitialstate()) {
    on<ChangeLanguageEvent>(_changeLanguageEvent);
  }

  FutureOr<void> _changeLanguageEvent(ChangeLanguageEvent event, Emitter<LocalizationState> emit) {
  }
}

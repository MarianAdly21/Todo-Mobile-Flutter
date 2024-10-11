import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_mobile/features/language/configuration_lang.dart';
import 'package:todo_mobile/features/language/language_cubit/language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(InitialLanguageState());

  void changeLang(String lang) {
    ConfagurationLanguage.loadLang(lang);
    emit(LoadedLanguageState());
  }
}

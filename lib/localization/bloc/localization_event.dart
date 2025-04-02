part of 'localization_bloc.dart';

@immutable
sealed class LocalizationEvent {}
class ChangeLanguageEvent extends LocalizationEvent{}

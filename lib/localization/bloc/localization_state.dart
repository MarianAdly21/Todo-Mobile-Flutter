part of 'localization_bloc.dart';

@immutable
sealed class LocalizationState {}

final class LocalizationInitialstate extends LocalizationState {}

final class ChangeLanguagestate extends LocalizationState {
  final String language;

  ChangeLanguagestate({required this.language});
}

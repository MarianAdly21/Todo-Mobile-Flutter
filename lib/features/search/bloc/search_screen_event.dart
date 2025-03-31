part of 'search_screen_bloc.dart';

@immutable
sealed class SearchScreenEvent {}
class DeleteFromSearchFormEvent extends SearchScreenEvent {}
class GetTasksEvent extends SearchScreenEvent {}


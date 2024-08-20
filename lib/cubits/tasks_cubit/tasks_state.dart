part of 'tasks_cubit.dart';

@immutable
sealed class TasksState {}

final class TasksInitial extends TasksState {}

final class TasksAddLoading extends TasksState {}

final class TasksAddSuccess extends TasksState {}

final class TasksAddFailure extends TasksState {
  final String errorMessage;

  TasksAddFailure({required this.errorMessage});
}

final class TasksDoneLoading extends TasksState {}

final class TasksDoneSuccess extends TasksState {}

final class TasksDoneFailure extends TasksState {}

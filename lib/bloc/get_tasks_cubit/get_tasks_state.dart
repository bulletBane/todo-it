part of 'get_tasks_cubit.dart';

abstract class GetTasksState extends Equatable {
  const GetTasksState();

  @override
  List<Object> get props => [];
}

class GetTasksInitial extends GetTasksState {}

class GetTasksLoading extends GetTasksState {}

class GetTasksLoadSuccess extends GetTasksState {
  const GetTasksLoadSuccess({this.finishedTasks, this.activeTasks});

  final List<Task> activeTasks;
  final List<Task> finishedTasks;
}

class GetTasksLoadFailed extends GetTasksState {
  const GetTasksLoadFailed({String e});
}

class GetTasksEmpty extends GetTasksState {}

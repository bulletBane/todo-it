part of 'get_todos_cubit.dart';

abstract class GetTodosState extends Equatable {
  const GetTodosState();

  @override
  List<Object> get props => [];
}

class GetTodosInitial extends GetTodosState {}

class GetTodosSuccess extends GetTodosState {}

class GetTodosFailed extends GetTodosState {}

part of 'create_new_todo_cubit.dart';

abstract class CreateNewTodoState extends Equatable {
  const CreateNewTodoState();

  @override
  List<Object> get props => [];
}

class CreateNewTodoInitial extends CreateNewTodoState {}

class CreateNewTodoSucces extends CreateNewTodoState {}

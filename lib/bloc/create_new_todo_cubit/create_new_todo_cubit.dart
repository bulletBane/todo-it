import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_it/data/models/task.dart';
import 'package:todo_it/data/repos/create_todo.dart';

part 'create_new_todo_state.dart';

class CreateNewTaskCubit extends Cubit<CreateNewTodoState> {
  CreateNewTaskCubit() : super(CreateNewTodoInitial());
  void createNewTask(Task task) {
    CreateTodoRepo repo = CreateTodoRepo();
    repo.createTodo(task: task);
    emit(CreateNewTodoSucces());
  }
}

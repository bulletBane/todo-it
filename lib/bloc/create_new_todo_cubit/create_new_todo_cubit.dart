import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_it/data/models/todo.dart';
import 'package:todo_it/data/repos/create_todo.dart';

part 'create_new_todo_state.dart';

class CreateNewTodoCubit extends Cubit<CreateNewTodoState> {
  CreateNewTodoCubit() : super(CreateNewTodoInitial());
  void createNewTodo(final Todo todo) {
    String uid = FirebaseAuth.instance.currentUser.uid;
    CreateTodoRepo repo = CreateTodoRepo();
    repo.createTodo(uid: uid, todo: todo);
    emit(CreateNewTodoSucces());
  }
}

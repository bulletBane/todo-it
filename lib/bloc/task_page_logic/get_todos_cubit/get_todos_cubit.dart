import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_it/data/repos/get_todos.dart';

part 'get_todos_state.dart';

class GetTodosCubit extends Cubit<GetTodosState> {
  GetTodosCubit() : super(GetTodosInitial());

  void getTodos() async {
    GetTodoRepo repo = GetActieTodosRepo();
    String uid = FirebaseAuth.instance.currentUser.uid;
    repo.getTodo(uid);
  }
}

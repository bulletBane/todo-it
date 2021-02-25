import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'todo_page_add_todo_state.dart';

class TodoPageAddTodoCubit extends Cubit<TodoPageAddTodoState> {
  TodoPageAddTodoCubit() : super(TodoPageAddTodoInitial());
}

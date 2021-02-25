import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_it/data/models/task.dart';
import 'package:todo_it/data/repos/get_tasks.dart';

part 'get_tasks_state.dart';

class GetTasksCubit extends Cubit<GetTasksState> {
  GetTasksCubit() : super(GetTasksInitial());

  void getTasks() async {
    try {
      emit(GetTasksLoading());

      List<GetTasksRepo> repos = [GetActiveTasks(), GetFinishedTasks()];

      List<Task> activeTasks = await repos[0].getTasks();

      List<Task> finishedTasks = await repos[1].getTasks();

      if (activeTasks.isNotEmpty || finishedTasks.isNotEmpty)
        emit(GetTasksLoadSuccess(
            activeTasks: activeTasks, finishedTasks: finishedTasks));
      else
        emit(GetTasksEmpty());
    } catch (e) {
      emit(GetTasksLoadFailed(e: e.toString()));
    }
  }
}

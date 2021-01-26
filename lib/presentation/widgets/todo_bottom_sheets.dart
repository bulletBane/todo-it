import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_it/bloc/create_new_todo_cubit/create_new_todo_cubit.dart';
import 'package:todo_it/data/models/todo.dart';
import 'package:todo_it/presentation/widgets/todo_actions.dart';

class TodoBottomSheets {
  TodoAction action = TodoAction();

  Future createTaskBottomSheet(BuildContext context) {
    TextEditingController _controller = TextEditingController();
    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        builder: (context) => Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: ConstrainedBox(
                constraints:
                    BoxConstraints(maxHeight: 1.sw - 100.h, minHeight: 58.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      controller: _controller,
                      keyboardType: TextInputType.multiline,
                      maxLines: 12,
                      minLines: 1,
                      expands: false,
                      textAlignVertical: TextAlignVertical.center,
                      cursorColor: Theme.of(context).primaryColor,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Theme.of(context).scaffoldBackgroundColor,
                          hintText: 'Заголовок задания',
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 5.w,
                            ),
                            action.dateButton(context),
                            action.priorityButton(context),
                            action.listButton(context)
                          ],
                        ),
                        IconButton(
                            splashRadius: 30.h,
                            icon: Icon(
                              Icons.send,
                              color: Theme.of(context).primaryColor,
                              size: 25.ssp,
                            ),
                            onPressed: () {
                              Todo todo = Todo(
                                  title: _controller.text,
                                  priority: 'High',
                                  dueDate: '03/03/12',
                                  startDate: '03/03/13',
                                  list: 'Personal');
                              BlocProvider.of<CreateNewTodoCubit>(context)
                                  .createNewTodo(todo);
                            })
                      ],
                    ),
                  ],
                ),
              ),
            ));
  }
}

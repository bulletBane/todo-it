import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_it/bloc/create_new_todo_cubit/create_new_todo_cubit.dart';
import 'package:todo_it/data/models/todo.dart';
import 'package:todo_it/presentation/widgets/todo_actions.dart';

class TodoBottomSheets {
  Future createTaskBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        builder: (context) => _Content());
  }
}

class _Content extends StatefulWidget {
  _Content({Key key}) : super(key: key);

  @override
  __ContentState createState() => __ContentState();
}

class __ContentState extends State<_Content> {
  TextEditingController _controller = TextEditingController();
  DateTime time;
  TodoAction action = TodoAction();
  int diference = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: 1.sw - 100.h, minHeight: 58.h),
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
                    action.dateButton(
                        context: context,
                        onPressed: () => showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2021),
                                    lastDate: DateTime(2022),
                                    locale: Locale("ru", "RU"))
                                .then((value) {
                              setState(() {
                                diference = value != null
                                    ? value.difference(DateTime.now()).inDays
                                    : 0;
                              });
                              print(diference);
                              print(diference.abs() % 10);
                            }),
                        dif: diference),
                    // CalendarDatePicker(
                    //     initialDate: DateTime.now(),
                    //     firstDate: firstDate,
                    //     lastDate: lastDate,
                    //     onDateChanged: (time) {})),
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
    );
  }
}

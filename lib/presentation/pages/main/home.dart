import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_it/bloc/create_new_todo_cubit/create_new_todo_cubit.dart';
import 'package:todo_it/bloc/get_tasks_cubit/get_tasks_cubit.dart';
import 'package:todo_it/presentation/pages/todo/create_todo_page.dart';
import 'package:todo_it/presentation/widgets/todo_block.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_it/presentation/widgets/todo_bottom_sheets.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // TodoBottomSheets sheets = TodoBottomSheets();
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetTasksCubit>(context).getTasks();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedTheme(
        data: Theme.of(context),
        child: BlocListener<CreateNewTaskCubit, CreateNewTodoState>(
          listener: (context, state) {
            if (state is CreateNewTodoSucces) Navigator.of(context).pop();
          },
          child: Scaffold(
              appBar: AppBar(
                actions: [
                  IconButton(
                      icon: Icon(
                        Icons.brightness_2_rounded,
                        color: Theme.of(context).primaryColorDark,
                      ),
                      onPressed: () =>
                          AdaptiveTheme.of(context).toggleThemeMode())
                ],
                title: Text(
                  'Ваши задачи',
                  style: TextStyle(color: Theme.of(context).primaryColorDark),
                ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.endFloat,
              floatingActionButton: FloatingActionButton(
                backgroundColor: Theme.of(context).primaryColor,
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => BlocProvider(
                          create: (context) => CreateNewTaskCubit(),
                          child: CreateNewTodoPage())));
                },
                // onPressed: () => sheets.createTaskBottomSheet(context),
                child: Icon(Icons.add),
              ),
              body: CustomScrollView(
                slivers: [
                  SliverList(
                      delegate: SliverChildBuilderDelegate((context, i) {
                    return BlocProvider(
                      create: (context) => CreateNewTaskCubit(),
                      child: TodoBlock(),
                    );
                  }, childCount: 10)),
                  SliverPadding(
                    padding: EdgeInsets.only(left: 12.w),
                    sliver: SliverList(
                        delegate:
                            SliverChildListDelegate([Text('Выполненно')])),
                  ),
                  SliverList(
                      delegate: SliverChildBuilderDelegate((context, i) {
                    return TodoBlock();
                  }, childCount: 10))
                ],
              )),
        ));
  }
}

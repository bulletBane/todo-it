import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:todo_it/presentation/widgets/todo_actions.dart';
import 'package:todo_it/presentation/widgets/todo_block.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_it/presentation/widgets/todo_bottom_sheets.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TodoBottomSheets sheets = TodoBottomSheets();

  @override
  Widget build(BuildContext context) {
    return AnimatedTheme(
      data: Theme.of(context),
      child: Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                  icon: Icon(
                    Icons.brightness_2_rounded,
                    color: Theme.of(context).primaryColorDark,
                  ),
                  onPressed: () => AdaptiveTheme.of(context).toggleThemeMode())
            ],
            title: Text(
              'Ваши задачи',
              style: TextStyle(color: Theme.of(context).primaryColorDark),
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          floatingActionButton: FloatingActionButton(
            backgroundColor: Theme.of(context).primaryColor,
            onPressed: () => sheets.createTaskBottomSheet(context),
            child: Icon(Icons.add),
          ),
          body: CustomScrollView(
            slivers: [
              SliverList(
                  delegate: SliverChildBuilderDelegate((context, i) {
                return TodoBlock();
              }, childCount: 10)),
              SliverPadding(
                padding: EdgeInsets.only(left: 12.w),
                sliver: SliverList(
                    delegate: SliverChildListDelegate([Text('Выполненно')])),
              ),
              SliverList(
                  delegate: SliverChildBuilderDelegate((context, i) {
                return TodoBlock();
              }, childCount: 10))
            ],
          )),
    );
  }
}

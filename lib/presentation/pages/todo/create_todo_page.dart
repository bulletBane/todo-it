import 'package:flutter/material.dart';

class CreateNewTodoPage extends StatefulWidget {
  CreateNewTodoPage({Key key}) : super(key: key);

  @override
  _CreateNewTodoPageState createState() => _CreateNewTodoPageState();
}

class _CreateNewTodoPageState extends State<CreateNewTodoPage> {
  TextEditingController titleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: titleController,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_it/bloc/auth_state_bloc/auth_state_bloc.dart';
import 'package:todo_it/bloc/create_new_todo_cubit/create_new_todo_cubit.dart';
import 'package:todo_it/bloc/registration_cubit/registration_cubit.dart';
import 'package:todo_it/presentation/pages/auth/auth_wrapper.dart';
import 'package:todo_it/presentation/pages/auth/registration_page.dart';
import 'package:todo_it/presentation/pages/main/home.dart';

import '../../main.dart';

class Wraperr extends StatefulWidget {
  final ThemeData light;
  final ThemeData dark;

  const Wraperr({Key key, this.light, this.dark}) : super(key: key);
  @override
  _WraperrState createState() => _WraperrState();
}

class _WraperrState extends State<Wraperr> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<AuthStateBloc>(context).add(GetUserEvent());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: widget.light,
      darkTheme: widget.dark,
      home: BlocBuilder<AuthStateBloc, AuthStateState>(
        builder: (context, state) {
          if (state is NotAuthenticatedState) {
            return AuthWrapperPage();
          } else if (state is AuthenticatedState) {
            return BlocProvider(
              create: (context) => CreateNewTodoCubit(),
              child: HomePage(),
            );
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}

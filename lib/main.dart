import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_it/bloc/registration_cubit/registration_cubit.dart';
import 'package:todo_it/presentation/pages/auth/registration_page.dart';
// import 'package:my_todo/presentation/screens/home_page.dart';

// import 'business_logic/blocs/todo_bloc/todos_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Text('Unable to load');
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                visualDensity: VisualDensity.adaptivePlatformDensity,
              ),
              home: BlocProvider(
                  create: (context) => RegistrationCubit(),
                  child: RegistrationPage())

              // home: BlocProvider(
              //   create: (context) => TodosBloc(),
              //   child: TodoMainPage(),
              // ),
              );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

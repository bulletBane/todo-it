import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_it/bloc/registration_cubit/registration_cubit.dart';
import 'package:todo_it/presentation/pages/auth/registration_page.dart';
import 'package:todo_it/presentation/shared/theme.dart';
// import 'package:my_todo/presentation/screens/home_page.dart';

// import 'business_logic/blocs/todo_bloc/todos_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  runApp(MyApp(
    savedThemeMode: savedThemeMode,
  ));
}

class MyApp extends StatelessWidget {
  final AdaptiveThemeMode savedThemeMode;

  const MyApp({Key key, this.savedThemeMode}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Unable to load');
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return AdaptiveTheme(
            light: lightTheme,
            dark: darkTheme,
            initial: savedThemeMode ?? AdaptiveThemeMode.light,
            builder: (theme, darkTheme) => MaterialApp(
                title: 'Flutter Demo',
                theme: theme,
                darkTheme: darkTheme,
                home: BlocProvider(
                    create: (context) => RegistrationCubit(),
                    child: RegistrationPage())),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_it/bloc/auth_state_bloc/auth_state_bloc.dart';
import 'package:todo_it/bloc/create_new_todo_cubit/create_new_todo_cubit.dart';
import 'package:todo_it/bloc/registration_cubit/registration_cubit.dart';
import 'package:todo_it/presentation/pages/auth/auth_wrapper.dart';
import 'package:todo_it/presentation/pages/auth/registration_page.dart';
import 'package:todo_it/presentation/pages/wrapper.dart';
import 'package:todo_it/presentation/shared/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// import 'package:my_todo/presentation/screens/home_page.dart';

// import 'business_logic/blocs/todo_bloc/todos_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  runApp(BlocProvider(
    create: (context) => AuthStateBloc(),
    child: MyApp(
      savedThemeMode: savedThemeMode,
    ),
  ));
}

class MyApp extends StatelessWidget {
  final AdaptiveThemeMode savedThemeMode;

  const MyApp({Key key, this.savedThemeMode}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(372, 812),
      allowFontScaling: false,
      child: FutureBuilder(
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
                initial: savedThemeMode ?? AdaptiveThemeMode.system,
                builder: (theme, darkTheme) => MultiBlocProvider(
                        providers: [
                          BlocProvider(
                            create: (context) => AuthStateBloc(),
                          ),
                          BlocProvider(
                              create: (context) => CreateNewTodoCubit())
                        ],
                        child: Wraperr(
                          light: theme,
                          dark: darkTheme,
                        )));
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class LoggedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'You logged',
          style: TextStyle(color: Theme.of(context).primaryColorDark),
        ),
      ),
      body: Center(
        child: FloatingActionButton(
          onPressed: () {
            FirebaseAuth.instance.signOut();
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => AuthWrapperPage()));
          },
        ),
      ),
    );
  }
}

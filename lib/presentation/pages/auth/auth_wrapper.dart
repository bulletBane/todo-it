import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_it/bloc/auth_state_bloc/auth_state_bloc.dart';
import 'package:todo_it/bloc/login_cubit/login_cubit.dart';
import 'package:todo_it/bloc/registration_cubit/registration_cubit.dart';
import 'package:todo_it/presentation/pages/auth/registration_page.dart';

import 'loggin.dart';

class AuthWrapperPage extends StatefulWidget {
  @override
  _AuthWrapperPageState createState() => _AuthWrapperPageState();
}

class _AuthWrapperPageState extends State<AuthWrapperPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Аутентификация',
          style: TextStyle(color: Theme.of(context).primaryColorDark),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 1.h,
            ),
            Text(
              'Привет!\nЯ сделаю твой день продктвинее!\nДавай начнем',
              style: Theme.of(context).textTheme.headline6,
            ),
            Center(
              child: Column(
                children: [
                  SizedBox(
                      width: 350.w,
                      height: 65.h,
                      child: RaisedButton(
                        elevation: 0,
                        color: Theme.of(context).scaffoldBackgroundColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.ssp)),
                        child: Text(
                          'Войти',
                          style: TextStyle(
                              color: Theme.of(context).primaryColorDark),
                        ),
                        onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => BlocProvider(
                                    create: (context) => LoginCubit(),
                                    child: LoginPage()))),
                      )),
                  SizedBox(height: 15.h),
                  SizedBox(
                      width: 350.w,
                      height: 65.h,
                      child: FloatingActionButton(
                        backgroundColor: Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.ssp)),
                        child: Text('Регистрация'),
                        onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => BlocProvider(
                                    create: (context) => RegistrationCubit(),
                                    child: RegistrationPage()))),
                      )),
                  SizedBox(
                    height: 20.h,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_it/bloc/login_cubit/login_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_it/main.dart';
import 'package:todo_it/presentation/pages/main/home.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AnimatedTheme(
      data: Theme.of(context),
      duration: Duration(milliseconds: 100),
      child: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: Text(
              'Вход',
              style: TextStyle(color: Theme.of(context).primaryColorDark),
            ),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          ),
          body: BlocListener<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginSuccess) {
                Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text('Успех!')));
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => HomePage()));
              }
            },
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 30.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Form(
                      key: _formKey,
                      child: Container(
                        width: 1.sw,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 30.h,
                            ),
                            TextFormField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                  filled: true,
                                  hintText: 'Введите логин',
                                  labelText: 'Логин',
                                  contentPadding: EdgeInsets.only(left: 15.w),
                                  border: InputBorder.none,
                                  focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.redAccent[400])),
                                  errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.redAccent[400])),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                              Theme.of(context).primaryColor))),
                              validator: (value) {
                                if (!EmailValidator.validate(value)) {
                                  return 'Введен не корректный email';
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            TextFormField(
                              controller: _passwordController,
                              obscureText: true,
                              decoration: InputDecoration(
                                  filled: true,
                                  hintText: 'Введите пароль',
                                  labelText: 'Пароль',
                                  contentPadding: EdgeInsets.only(left: 15.w),
                                  border: InputBorder.none,
                                  focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.redAccent[400])),
                                  errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.redAccent[400])),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                              Theme.of(context).primaryColor))),
                              validator: (value) {
                                if (!(value.length > 6)) {
                                  return 'Пароль слишком короткий';
                                }
                                return null;
                              },
                            ),
                            FlatButton(
                                onPressed: () => null,
                                child: Text('Нет аккаунт? Создать')),
                            FlatButton(
                                onPressed: () =>
                                    FirebaseAuth.instance.signOut(),
                                child: Text('Выход'))
                          ],
                        ),
                      )),
                ],
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: SizedBox(
            height: 60.h,
            width: 330.w,
            child: FloatingActionButton(
              backgroundColor: Theme.of(context).primaryColor,
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.ssp)),
              child: Text(
                'Войти',
              ),
              onPressed: () async {
                print('e is ${_emailController.text}');
                print('p is ${_passwordController.text}');
                if (_formKey.currentState.validate()) {
                  BlocProvider.of<LoginCubit>(context).loginUser(
                      password: _passwordController.text,
                      email: _emailController.text);
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}

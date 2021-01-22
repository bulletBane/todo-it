import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_it/bloc/registration_cubit/registration_cubit.dart';

class RegistrationPage extends StatefulWidget {
  RegistrationPage({Key key}) : super(key: key);

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: Text('Регистрация'),
        ),
        body: BlocListener<RegistrationCubit, RegistrationState>(
          listener: (context, state) {
            if (state is RegistrationSucces) {
              Scaffold.of(context)
                  .showSnackBar(SnackBar(content: Text('Успех!')));
            }
          },
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _emailController,
                    validator: (value) {
                      if (!EmailValidator.validate(value)) {
                        return 'Введен не корректный email';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _passwordController,
                    validator: (value) {
                      if (!(value.length > 6)) {
                        return 'Пароль слишком короткий';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _nameController,
                    validator: (value) {
                      if ((value.isEmpty)) {
                        return 'Введите имя';
                      }
                      return null;
                    },
                  ),
                  FlatButton(
                      onPressed: () async {
                        print('e is ${_emailController.text}');
                        print('p is ${_passwordController.text}');
                        if (_formKey.currentState.validate()) {
                          BlocProvider.of<RegistrationCubit>(context)
                              .createNewAccount(
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                  name: _nameController.text);
                        }
                      },
                      child: Text('Регистрация')),
                  FlatButton(
                      onPressed: () async {
                        print('e is ${_emailController.text}');
                        print('p is ${_passwordController.text}');
                        await FirebaseAuth.instance.signOut();
                      },
                      child: Text('Выход'))
                ],
              )),
        ),
      ),
    );
  }
}

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_it/data/models/user.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  void loginUser({@required String password, @required String email}) async {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);

    CollectionReference _usersCollection =
        FirebaseFirestore.instance.collection('users');

    String _name = await _usersCollection
        .doc(userCredential.user.uid)
        .get()
        .then((value) => value["name"]);
    ModelUser user =
        ModelUser(uid: userCredential.user.uid, email: email, name: _name);

    emit(LoginSuccess(user));
  }
}

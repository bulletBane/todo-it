import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:todo_it/data/models/user.dart';

part 'registration_state.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  RegistrationCubit() : super(RegistrationInitial());

  void createNewAccount(
      {@required String email,
      @required String password,
      @required name}) async {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    ModelUser userModel =
        ModelUser(email: email, uid: userCredential.user.uid, name: name);
    CollectionReference _usersCollection =
        FirebaseFirestore.instance.collection('users');

    _usersCollection.doc(userModel.uid).set({
      "uid": userModel.uid,
      "email": userModel.email,
      "name": userModel.name,
    });

    emit(RegistrationSucces(userModel));
    print(userCredential);
  }
}

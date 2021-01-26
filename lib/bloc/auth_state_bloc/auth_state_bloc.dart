import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_state_event.dart';
part 'auth_state_state.dart';

class AuthStateBloc extends Bloc<AuthStateEvent, AuthStateState> {
  AuthStateBloc() : super(AuthStateInitial());

  @override
  Stream<AuthStateState> mapEventToState(
    AuthStateEvent event,
  ) async* {
    // TODO: implement mapEventToState
    if (event is GetUserEvent) {
      User user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        yield AuthenticatedState();
        print('STATE IS ${state.toString()}');
      } else
        yield NotAuthenticatedState();
    }
  }
}

part of 'auth_state_bloc.dart';

abstract class AuthStateState extends Equatable {
  const AuthStateState();

  @override
  List<Object> get props => [];
}

class AuthStateInitial extends AuthStateState {}

class AuthenticatedState extends AuthStateState {}

class NotAuthenticatedState extends AuthStateState {}

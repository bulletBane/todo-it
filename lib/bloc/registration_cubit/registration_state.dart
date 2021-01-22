part of 'registration_cubit.dart';

abstract class RegistrationState extends Equatable {
  const RegistrationState();

  @override
  List<Object> get props => [];
}

class RegistrationInitial extends RegistrationState {}

class RegistrationSucces extends RegistrationState {
  final ModelUser newUser;

  RegistrationSucces(this.newUser);
}

class RegistrationFailed extends RegistrationState {
  final String e;

  RegistrationFailed({this.e});
}

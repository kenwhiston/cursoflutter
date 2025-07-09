abstract class LoginEvent {}

class LoginUserNameChanged extends LoginEvent {
  final String userName;

  LoginUserNameChanged({required this.userName});
}

class LoginPasswordChanged extends LoginEvent {
  final String password;

  LoginPasswordChanged({required this.password});
}

class LoginButtonPressed extends LoginEvent {
  final String userName;
  final String password;

  LoginButtonPressed({required this.userName, required this.password});
}

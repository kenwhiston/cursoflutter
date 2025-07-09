class LoginState {
  final String userName;
  final String password;
  final bool loginSuccess;

  LoginState({
    this.userName = '',
    this.password = '',
    this.loginSuccess = false,
  });

  LoginState copyWith({
    String? userName,
    String? password,
    bool? loginSuccess,
  }) {
    return LoginState(
      userName: userName ?? this.userName,
      password: password ?? this.password,
      loginSuccess: loginSuccess ?? this.loginSuccess,
    );
  }
}



import 'package:flutter_bloc/flutter_bloc.dart';

import '../service/login_api.dart';
import 'login_events.dart';
import 'login_states.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState>{

  final LoginRepository loginRepository;

  LoginBloc({required this.loginRepository}) : super(LoginState()){

    on<LoginUserNameChanged>((event, emit) {
      emit(state.copyWith(userName: event.userName));
    },);

    on<LoginPasswordChanged>((event, emit) {
      emit(state.copyWith(password: event.password));
    });

    on<LoginButtonPressed>(_callLogin);

  }

  void _callLogin(LoginButtonPressed event, Emitter<LoginState> emit) async {
    try {
      final result = await loginRepository.login(event.userName, event.password);
      emit(state.copyWith(loginSuccess: result));
    } catch (e){
      emit(state.copyWith(loginSuccess: false));
    }
  }

}
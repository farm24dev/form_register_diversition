part of 'register_bloc.dart';

sealed class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class RegisterRequestEvent extends RegisterEvent {
  const RegisterRequestEvent();

  @override
  List<Object> get props => [];
}

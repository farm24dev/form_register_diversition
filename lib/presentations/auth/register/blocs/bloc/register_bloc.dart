import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    on<RegisterRequestEvent>(_onRegisterRequestEvent);
  }

  Future<void> _onRegisterRequestEvent(RegisterRequestEvent event, Emitter<RegisterState> emit) async {
    emit(RegisterLoading());
    try {
      //TODO
      await Future.delayed(const Duration(seconds: 2));
      emit(RegisterSuccess());
    } catch (e) {
      emit(RegisterFailure());
    }
  }
}

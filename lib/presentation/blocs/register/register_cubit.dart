import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/infrastructure/validators/email.dart';
import 'package:forms_app/infrastructure/validators/inputs.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterFormState> {
  RegisterCubit() : super(const RegisterFormState());

  void onSubmit() {
    emit(
      state.copyWith(
        formStatus: FormStatus.validating,
        userName: Username.dirty(value: state.userName.value),
        password: Password.dirty(value: state.password.value),
        email: Email.dirty(value: state.email.value),
        isValid: Formz.validate([
          state.userName,
          state.password,
          state.email
        ])
      )
    );

    print("Since cubit submit state: $state");
  }

  void usernameChanged(String value) {
    final userName = Username.dirty(value: value);

    emit (
      state.copyWith(
          userName: userName,
          isValid: Formz.validate([ userName, state.password, state.email ])
      )
    );
  }

  void emailChanged(String value) {
    Email email = Email.dirty(value: value);

    emit (
      state.copyWith(
        email: email,
        isValid: Formz.validate([ email, state.userName, state.password ])
      )
    );
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value: value);
    emit (
      state.copyWith(
        password: password,
        isValid: Formz.validate([ password, state.userName, state.email ])
      )
    );
  }

}

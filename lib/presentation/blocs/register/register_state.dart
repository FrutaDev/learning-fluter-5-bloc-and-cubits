part of 'register_cubit.dart';

enum FormStatus {invalid, valid, validating, posting}

@immutable
class RegisterFormState extends Equatable{
  final FormStatus formStatus;
  final bool isValid;
  final Username userName;
  final Email email;
  final Password password;

  const RegisterFormState({
    this.userName = const Username.pure(),
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.formStatus = FormStatus.invalid,
    this.isValid = false
  });

  RegisterFormState copyWith({
    Username? userName,
    Email? email,
    Password? password,
    FormStatus? formStatus,
    bool? isValid
  }) => RegisterFormState(
    userName: userName ?? this.userName,
    email: email ?? this.email,
    password: password ?? this.password,
    formStatus: formStatus ?? this.formStatus,
    isValid: isValid ?? this.isValid
  );


  @override
  // TODO: implement props
  List<Object?> get props => [ userName, email, password, isValid, formStatus ];
}


part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

// Login ststes
class LoginLodaing extends AuthState {}

class LoginLoaded extends AuthState {
  const LoginLoaded({required this.loginModel});
  final LoginModel loginModel;
  @override
  List<Object> get props => [loginModel];
}

class LoginError extends AuthState {
  final String msg;
  const LoginError({required this.msg});
  @override
  List<Object> get props => [msg];
}

// register ststes
class RegisterLodaing extends AuthState {}

class RegisterLoaded extends AuthState {
  const RegisterLoaded({required this.registerModel});
  final RegisterModel registerModel;
  @override
  List<Object> get props => [registerModel];
}

class RegisterError extends AuthState {
  final String msg;
  const RegisterError({required this.msg});
  @override
  List<Object> get props => [msg];
}

// ignore_for_file: sort_constructors_first

part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthProgress extends AuthState {}

class AuthProeses extends AuthState {
  final ResponseModel responseModel;
  const AuthProeses({required this.responseModel});
}

class AuthError extends AuthState {
  final Map<String, dynamic> message;
  const AuthError({required this.message});
}

class Profile extends AuthState {
  final SharedPreferences sharedPreferences;
  const Profile({required this.sharedPreferences});
}

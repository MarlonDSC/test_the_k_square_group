part of 'users_bloc.dart';

sealed class UsersState extends Equatable {
  const UsersState();

  @override
  List<Object> get props => [];
}

final class LoadingUsersState extends UsersState {}

final class LoadedUsersState extends UsersState {
  final List<User> users;

  const LoadedUsersState({required this.users});

  @override
  List<Object> get props => [users];
}

final class ErrorUsersState extends UsersState {
  final String message;

  const ErrorUsersState(this.message);
}

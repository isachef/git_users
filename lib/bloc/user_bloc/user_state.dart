part of 'user_bloc.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

class SplashScreen extends UserState {}

class UsersFetchedState extends UserState {
  final List<User> usersList;

  UsersFetchedState({required this.usersList});
}

class UsersErrorState extends UserState {
  final String error;

  UsersErrorState(this.error);
}

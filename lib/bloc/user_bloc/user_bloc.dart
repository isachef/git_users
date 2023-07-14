import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';
import 'package:tt_c/bloc/user_bloc/user_provider.dart';
import 'package:tt_c/helpers/catch_exception.dart';
import 'package:tt_c/models/user_model.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<GetUsers>((event, emit) async{
      emit(SplashScreen());
      await Future.delayed(Duration(seconds: 3));
      UserProvider userProvider=UserProvider();
      List<User> usersList;
      try{
        usersList= await userProvider.getUsers();
        emit(UsersFetchedState(usersList: usersList));
      }catch(e){
        emit(UsersErrorState(CatchException.convertException(e).message!));
      }

    });
  }
}

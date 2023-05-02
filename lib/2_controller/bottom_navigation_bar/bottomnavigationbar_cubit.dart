import 'package:amitproject/1_view/screens/applied_screen.dart';
import 'package:amitproject/1_view/screens/home_screen.dart';
import 'package:amitproject/1_view/screens/messages_screen.dart';
import 'package:amitproject/1_view/screens/profile_screen.dart';
import 'package:amitproject/1_view/screens/saved_screen.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'bottomnavigationbar_state.dart';

class BottomNavigationBarCubit extends Cubit<BottomNavigationBarState> {
  BottomNavigationBarCubit() : super(BottomNavigationBarInitial());

int currentIndex=0;
List<Widget>screens=const[
  HomeScreen(),
  MessagesScreen(),
  AppliedScreen(),
  SavedScreen(),
  ProfileScreen()
];



  void changeIndex(int index){
    currentIndex=index;
    emit(AppChangeBottomNavigationBarState());
  }













}

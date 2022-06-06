import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/layout/cubit/states.dart';
import 'package:news/modules/business_screen.dart';
import 'package:news/modules/science_screen.dart';
import 'package:news/modules/settings_screen.dart';
import 'package:news/modules/sports_screen.dart';

class NewsCubit extends Cubit<NewsStates>{
  NewsCubit() :super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);
  int currentModuleIndex = 0;
  List<BottomNavigationBarItem> bottomNavigationBarItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: 'Business',
    ),
        const BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: 'Sports',
    ),
        const BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: 'Science',
    ),
        const BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: 'Settings',
    ),
  ];
  List<Widget> screens =  [
    const BusinessScreen(),
    const SportsScreen(),
    const ScienceScreen(),
    const SettingsScreen()
  ];
  void changeModuleIndex(int index){
    currentModuleIndex = index;
    emit(ChangeBottomNavBarState());
  }
  
}
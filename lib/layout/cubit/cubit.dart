// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/layout/cubit/states.dart';
import 'package:news/modules/business_screen.dart';
import 'package:news/modules/science_screen.dart';
import 'package:news/modules/search/search_screen.dart';
import 'package:news/modules/settings_screen.dart';
import 'package:news/modules/sports_screen.dart';
import 'package:news/shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

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
      icon: Icon(Icons.search_rounded),
      label: 'Search',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: 'Settings',
    ),
  ];
  List<Widget> screens = [
    const BusinessScreen(),
    const SportsScreen(),
    const ScienceScreen(),
    const SearchScreen(),
    const SettingsScreen()

  ];
  void changeModuleIndex(int index) {
    currentModuleIndex = index;
    if(index == 1) getSportsData();
    if(index == 2) getScienceData();
    emit(ChangeBottomNavBarState());
  }

  List<dynamic> business = [];
  String apiKey = '688d756d00804fa5afd183478b18a442';

  void getBusniessData() {
    emit(NewsGetBusinessLoadingState());
    DioHelper.dioGetData(path: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'business',
      'apiKey': apiKey
    }).then((value) {
      business = value.data['articles'];
      print(business[0]['title']);
      emit(NewsGetDataBusinessSuccessState());
    }).catchError((onError) {
      print('Error retriveing data: $onError');
      emit(NewsGetDataBusinessFailedState(onError.toString()));
    });
  }
  List<dynamic> sports = [];
  void getSportsData() {
    emit(NewsGetSportsLoadingState());
    DioHelper.dioGetData(path: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'sports',
      'apiKey': apiKey
    }).then((value) {
      sports = value.data['articles'];
      print(sports[0]['title']);
      emit(NewsGetDataSportsSuccessState());
    }).catchError((onError) {
      print('Error retriveing data: $onError');
      emit(NewsGetDataSportsFailedState(onError.toString()));
    });
  }
  List<dynamic> science = [];
  void getScienceData() {
    emit(NewsGetScienceLoadingState());
    DioHelper.dioGetData(path: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'science',
      'apiKey': apiKey
    }).then((value) {
      science = value.data['articles'];
      print(science[0]['title']);
      emit(NewsGetDataScienceSuccessState());
    }).catchError((onError) {
      print('Error retriveing data: $onError');
      emit(NewsGetDataScienceFailedState(onError.toString()));
    });
  }
  List<dynamic> search= [];
  void getSearchData(String searchQuery) {
    emit(NewsGetSearchLoadingState());
    DioHelper.dioGetData(path: 'v2/everything', query: {
      'q': searchQuery,
      'apiKey': apiKey
    }).then((value) {
      search = value.data['articles'];
      print(search[0]['title']);
      emit(NewsGetDataSearchSuccessState());
    }).catchError((onError) {
      print('Error retriveing data: $onError');
      emit(NewsGetDataSearchFailedState(onError.toString()));
    });
  }
}





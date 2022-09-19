



import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:news_app/modules/business/business.dart';
import 'package:news_app/modules/science/science.dart';
import 'package:news_app/modules/sports/sports.dart';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../modules/settings/settings.dart';
import '../network/local/cache_helper.dart';
import '../network/remote/dio_helper.dart';
import 'package:news_app/shared/cubit/states.dart';



//import 'states.dart';




class CubitNewsApp extends Cubit <NewsAppState> {
  // CubitApp(AppState initialState) : super(initialState);
  CubitNewsApp() :super(intialState());

  //create object
  static CubitNewsApp get(context) => BlocProvider.of(context);
  int currentIndex=0;
  List<TabItem> items=[
    TabItem(icon: Icons.business, title: 'Business'),
    TabItem(icon: Icons.sports, title: 'Sports'),
    TabItem(icon: Icons.science, title: 'Science'),
   // TabItem(icon: Icons.settings, title: 'Settings'),

  ] ;
  List<dynamic> business=[];
  List<dynamic> sports=[];
  List<dynamic> science=[];
List<Widget> Screens=[business_screen(),sports_screen(),science_screen()];

  void changeIndex(int index){
    currentIndex=index;

    if(index ==1)
      get_Sports();
    if(index==2)
      get_Science();
    emit(changeNavBar());
  }
  void get_Business(){
    emit(NewsLoadingState());
    Dio_Helper.getData(
        path:'v2/top-headlines',
        query:{
          'country':'us',
          'category':'business',
          'apiKey':'c379699205ac419aba63b9ce0044a58e'
        }).
    then((value) {
      business=value.data['articles'];
         // print(business);
          print('with length ${business.length}');
          emit(getBusinessNewsState());
    })
        .catchError((error){
           print(error.toString());
           emit(getBusinessNewsErrorState(error.toString()));
    });


  }

  void get_Sports(){
    emit(SportsNewsLoadingState());
    if (sports.length==0){
      Dio_Helper.getData(
          path:'v2/top-headlines',
          query:{
            'country':'us',
            'category':'sports',
            'apiKey':'c379699205ac419aba63b9ce0044a58e'
          }).
      then((value) {
        sports=value.data['articles'];
        print(sports);
        print('with length ${sports.length}');
        emit(getSportsNewsState());
      })
          .catchError((error){
        print(error.toString());
        emit(getSportsNewsErrorState(error.toString()));
      });

    }else{
      emit(getSportsNewsState());
    }
  }

  void get_Science(){
    emit(ScienceNewsLoadingState());
   if(science.length==0){
     Dio_Helper.getData(
         path:'v2/top-headlines',
         query:{
           'country':'us',
           'category':'science',
           'apiKey':'c379699205ac419aba63b9ce0044a58e'
         }).
     then((value) {
       science=value.data['articles'];
      // print(science);
       print('science with length ${science.length}');
       emit(getScienceNewsState());
     })
         .catchError((error){
       print(error.toString());
       emit(getScienceNewsErrorState(error.toString()));
     });
   }else{
     emit(getScienceNewsState());
   }

  }
  var search=[];
  void get_Search(String value){
    emit(SearchNewsLoadingState());
    search=[];
      Dio_Helper.getData(
          path:'v2/everything',
          query:{
            'q':'$value',
            'apiKey':'c379699205ac419aba63b9ce0044a58e'
          }).
      then((value) {
        search=value.data['articles'];
       // print(sports);
        print('sports with length ${sports.length}');
        emit(getSearchNewsState());
      })
          .catchError((error){
        print(error.toString());
        emit(getSearchNewsErrorState(error.toString()));
      });


      //emit(getSearchNewsState());
    }
  bool darkMode=false;
  //var appmode =ThemeMode.dark;
  void changeMode({bool? fromShared}) {
    if (fromShared != null)
     { darkMode = fromShared;
    emit(ChangeModeState());
  }
    else {
      darkMode = !darkMode;

      CacheHelper.putData(key: 'darkMode', value: darkMode).
      then((value) => emit(ChangeModeState()));
    }
    print(darkMode);
  //  emit(ChangeModeState());
    // appmode=ThemeMode.light;
    // darkMode? true :false;

  }
  }



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/news_app/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../dio_helper.dart';
import '../Buisness/business_screen.dart';
import '../Science/science_screen.dart';
import '../Sports/sports_screen.dart';

class NewsCubit extends Cubit <NewsStates>{
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context)=>BlocProvider.of(context);

  int currentIndex=0;
  List<BottomNavigationBarItem> bottomItems=[
    BottomNavigationBarItem(
      icon: Icon(
        Icons.business,
      ),
      label: 'Business',
         ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.sports,
      ),
      label: 'Sports',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.science,
      ),
      label: 'Science',
    ),

  ];

  List<Widget>Screens=[
    BusinessScreen(),
  SportsScreen(),
    ScienceScreen(),

  ];

  void changeBottomNavBar (int index){
    currentIndex=index;
    if(index==1)
      getSports();
    if(index==2)
      getScience();
    emit(NewsBottomNavState());
  }

  List<dynamic>business=[];
  void getBusiness() {
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country':'us',
          'category':'business',
          'apiKey':'c37d4fbd3bd6473c99a1c79d35f80654',
        }).then((value){
      print(value.data['articles'][0].toString());
      business=value.data['articles'];
      print(business[0]['title']);
      emit(NewsGetBusinessSucessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetBusinessErrorState(error.toString()));
    });
  }

  List<dynamic>sports=[];
  void getSports() {
    emit(NewsGetSportsLoadingState());
    if(sports.length==0){
      DioHelper.getData(
          url: 'v2/top-headlines',
          query: {
            'country':'us',
            'category':'sports',
            'apiKey':'c37d4fbd3bd6473c99a1c79d35f80654',
          }).then((value){
        //print(value.data['articles'][0].toString());
        sports=value.data['articles'];
        print(sports[0]['title']);
        emit(NewsGetSportsSucessState());
      }).catchError((error){
        print(error.toString());
        emit(NewsGetSportsErrorState(error.toString()));
      });

    }
    else{
      emit(NewsGetScienceSucessState());
    }

  }
  List<dynamic>science=[];
  void getScience() {
    emit(NewsGetScienceLoadingState());
    if(science.length==0){
      DioHelper.getData(
          url: 'v2/top-headlines',
          query: {
            'country':'us',
            'category':'science',
            'apiKey':'c37d4fbd3bd6473c99a1c79d35f80654',
          }).then((value){
        //print(value.data['articles'][0].toString());
        science=value.data['articles'];
        print(science[0]['title']);
        emit(NewsGetScienceSucessState());
      }).catchError((error){
        print(error.toString());
        emit(NewsGetScienceErrorState(error.toString()));
      });
    }
    else{
      emit(NewsGetScienceSucessState());
    }
  }



  List<dynamic>search=[];
  void getSearch(String value) {
    emit(NewsGetSearchLoadingState());
    search =[];


      DioHelper.getData(
          url: 'v2/everything',
          query: {
            'q':'$value',
            'apiKey':'c37d4fbd3bd6473c99a1c79d35f80654',
          }).then((value){
        //print(value.data['articles'][0].toString());
        search=value.data['articles'];
        print(search[0]['title']);
        emit(NewsGetSearchSucessState());
      }).catchError((error){
        print(error.toString());
        emit(NewsGetSearchErrorState(error.toString()));
      });
    }


}
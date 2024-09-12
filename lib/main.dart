


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/bloc_observer.dart';
import 'package:newsapp/dio_helper.dart';
import 'package:newsapp/news_app/cubit/cubit.dart';
import 'package:newsapp/news_app/cubit/states.dart';
import 'package:newsapp/news_app/news_layout.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
void main() {
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  runApp(const MyApp());

}

class MyApp extends StatelessWidget{

  const MyApp({Key?key}) : super(key:key);
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => NewsCubit()..getBusiness()..getScience()..getSports(),
      child: BlocConsumer<NewsCubit,NewsStates>(
        listener: (context,state){},
        builder: (context,state){
          return MaterialApp(
            theme: ThemeData(
                primaryColor: Colors.white
            ),
            debugShowCheckedModeBanner: false,
            home: NewsLayout(),



          );
        },
      ),
    );

  }


}
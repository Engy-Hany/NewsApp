
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/news_app/search.dart';

import '../components.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';



class NewsLayout extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (BuildContext context, state) {  },
      builder: (BuildContext context,  state) {
        var cubit=NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text('News App'),
            actions: [
              IconButton(icon: Icon(Icons.search), onPressed: () {
                navigateTo(context, Search());
              },),
              IconButton(icon: Icon(Icons.brightness_4_outlined), onPressed: ()
              {
               // EyeCubit.get(context).ChangeAppMode();
              },),
            ],
          ),

          body: cubit.Screens[cubit.currentIndex] ,
          bottomNavigationBar: BottomNavigationBar(
             currentIndex: cubit.currentIndex,
             items: cubit.bottomItems,
            onTap: (index){
           cubit.changeBottomNavBar(index);
            },


          ),
        );
      },

    );
  }

}
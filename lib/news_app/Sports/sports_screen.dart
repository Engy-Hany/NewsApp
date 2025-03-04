import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:newsapp/components.dart';
import 'package:newsapp/news_app/cubit/cubit.dart';
import 'package:newsapp/news_app/cubit/states.dart';



class SportsScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state){
        var list=NewsCubit.get(context).sports;
        return  articleBulider(list,context);
      },

    );
  }

}


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../components.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';
class Search extends StatelessWidget{
  @override
  var SearchController= TextEditingController();
      Widget build(BuildContext context) {

    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state){
        var list = NewsCubit.get(context).search;
        return SafeArea(
        child: Scaffold(
        appBar: AppBar(),
        body: Column(
        children: [
        Padding(
        padding: const EdgeInsets.all(20.0),
        child: defaultFormField(
        controller: SearchController,
        type: TextInputType.text,
        onChanged: (value){
          NewsCubit.get(context).getSearch(value);
        },
        label: 'Search',
        prefix: Icons.search,
        validator: (value){
        if(value.isEmpty){
        return 'Search must not be empty!';
        }
        return null;
        }),
        ),
        Expanded(child: articleBulider(list, context,isSearch: true))
        ],
        ),
        ),
        );
      },

    );
  }

}
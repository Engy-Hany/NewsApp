

import 'package:flutter/material.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
Widget buildArticleItem(article,context)=> InkWell(
  onTap: (){
    //navigateTo(context, WebViewScreen(article['url']));
  },
  child:   Padding(

    padding: const EdgeInsets.all(20.0),

    child: Row(

      children: [

        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage('${article['urlToImage']}'),
                fit: BoxFit.cover,
              )),
        ),

        SizedBox(width: 20,),
        Expanded(
          child: Container(
            height: 120,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text('${article['title']}',
                    style: Theme.of(context).textTheme.bodyLarge,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,),
                ),
                Text('${article['publishedAt']}',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  ),
);

Widget articleBulider(list,context,{isSearch})=>ConditionalBuilder(
    condition: list.length>0 ,
    builder:(context)=> ListView.separated(
      physics: BouncingScrollPhysics(),
      itemBuilder: (context,index)=> buildArticleItem(list[index],context),
      separatorBuilder: (context,index)=>MyDivider(),
      itemCount: 10,),
      fallback: (context){
      if(isSearch == null ){
        return Center(child: CircularProgressIndicator());
      }
      else{
        return Container();
      }
      }
  );


Widget MyDivider() =>Container(
  width: double.infinity,
  height: 1,
  color: Colors.grey[300],
);
void navigateTo(context,widget) =>Navigator.push(
  context,
  MaterialPageRoute(
    builder:(context) =>widget,
  ),);

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  required String label,
  required IconData prefix,
  //required  Function validate,
  IconData? suffix,
  bool isPassword =false,
  final String? Function(dynamic value)? onSubmit,
  final String? Function(dynamic value)? onChanged,
  required String? Function(dynamic value) validator,
  Function()? suffixpressed,
  final Function()?Ontap,
  //required String? Function(dynamic value) Ontap,
  bool isclicable=true,
}) => TextFormField (
  controller: controller,
  keyboardType: type,
  obscureText: isPassword,
  onChanged: onChanged,
  onTap: Ontap,
  validator: validator,
  onFieldSubmitted:onSubmit,
  enabled: isclicable,
  style: TextStyle(
    color: Colors.black,
  ),
  decoration: InputDecoration(
    labelText: label,

    labelStyle: TextStyle(
      fontSize: 15,
      color: Color(0xffADA4A5),
    ),

    fillColor: Color(0xffF7F8F8),
    prefixIcon: Icon(
      prefix,
      color:Color(0xff074452),

    ),

    suffixIcon:suffix != null? IconButton(
      onPressed: suffixpressed,
      icon: Icon(
        suffix,
        color:Color(0xff074452),
      ),
    ) :null,

    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
        borderSide: BorderSide(
          //color: Colors.transparent,
          //width: 1,
          color: Colors.black,
        )
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.0),
      borderSide: BorderSide(
        color: Colors.blue,
      ),
    ),

  ),

);



import 'dart:ui';
import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import '../modules/web_view/web_view.dart';
import 'cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
Widget buildAerticleItem(article,context)
{ return InkWell(
  onTap : (){Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => webViewScreen(article['url'])),
  );},
  child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              Container(
                width: 120,
               height: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                color: Colors.grey,
                  image:  DecorationImage(
                    image: NetworkImage('${article['urlToImage']}'),
                      fit:BoxFit.cover
                  ),
                )
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                     Text('${article['title']}',
                       style: Theme.of(context).textTheme.bodyText1,
                       maxLines: 4,
                       overflow: TextOverflow.ellipsis,
                     ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text('${article['publishedAt']}',
                        style: const TextStyle(
                            fontSize: 15,
                          color:Colors.green
                        )
                    )
                  ]
                ),
              )
            ],
          ),
        ),
)
   ;
}
Widget articleBuilder(list,context)  =>(
  ConditionalBuilder(
    condition: State is! NewsLoadingState,
    builder:(context)=>
        ListView.separated(
            physics: BouncingScrollPhysics(),
              itemBuilder: ( context,  index)=>buildAerticleItem(list[index],context),
              separatorBuilder: (BuildContext context, int index)=>
        Container(
          height: 1,
          color: Colors.grey,
      ), itemCount: list.length,
),
          fallback: (BuildContext context)=> const Center (child:CircularProgressIndicator(
            color: Colors.green,
          ))

)
) ;




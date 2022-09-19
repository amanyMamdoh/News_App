import 'package:flutter/material.dart';
import 'package:news_app/shared/components.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/cubit/states.dart';
import '../../shared/cubit/cubit.dart';


class search_screen extends StatelessWidget {
  const search_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var searchText = TextEditingController();

    return BlocProvider(
      create: (BuildContext context) =>CubitNewsApp(),
        child: BlocConsumer<CubitNewsApp,NewsAppState>(

          listener: (BuildContext context, state) {  },
          builder: (BuildContext context, Object? state) {
            var search=CubitNewsApp.get(context).search;
            return Scaffold(

               appBar: AppBar(),
                body:Column(
                  children: [
                       Padding(
                          padding: EdgeInsets.all(20.0),
                           child: TextFormField(
                             controller: searchText,
                              decoration: const InputDecoration(
                                icon: Icon(Icons.search),
                                hintText: 'Enter text',

                               ),
                             keyboardType: TextInputType.text,
                             onChanged: (String value) {
                                 CubitNewsApp.get(context).get_Search(value);
                                 print(value);
                                },
                             validator: (String? value) {
                              return (value!.isEmpty) ? 'you should enter value' : null;
                           },
                       ),
                    ),
                Expanded(child: articleBuilder(search, context))
         ],
       )
     );
    },

        )


    );
  }
}

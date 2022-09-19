import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:news_app/shared/components.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';

//import '../../shared/components.dart';
class business_screen extends StatelessWidget {
  const business_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return  BlocConsumer<CubitNewsApp,NewsAppState>(
      listener: (context,state){},
      builder: (context,State) {
        var buisness=CubitNewsApp.get(context).business;
        return articleBuilder(buisness,context) ;


      },
    ) ;
  }
}

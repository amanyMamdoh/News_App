import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:news_app/shared/components.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';

//import '../../shared/components.dart';

class sports_screen extends StatelessWidget {
  const sports_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sports = CubitNewsApp.get(context).sports;
    return BlocConsumer<CubitNewsApp, NewsAppState>(
      listener: (context, state) {},
      builder: (context, State) {
         return articleBuilder(sports,context) ;
      },
    );
  }
}
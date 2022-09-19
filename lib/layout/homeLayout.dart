// ignore: file_names
// ignore: file_names


import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../modules/search/search.dart';
import '../shared/cubit/cubit.dart';
import '../shared/network/remote/dio_helper.dart';

class Home_layout extends StatelessWidget {
  const Home_layout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<CubitNewsApp,NewsAppState>(
      listener: (context,State){},
      builder: (context,State){
        var cubit= CubitNewsApp.get(context);
        return Scaffold(
        appBar: AppBar(
          title: Text('News app'
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => search_screen()),
                );
              },

            ),
            IconButton(
              icon: Icon(Icons.dark_mode_rounded),
              onPressed: (){
                CubitNewsApp.get(context).changeMode();

              },

            )
          ],
        ),
        body: cubit.Screens[cubit.currentIndex],

        bottomNavigationBar: ConvexAppBar(
              items:cubit.items,
            backgroundColor: Colors.green,
         initialActiveIndex: cubit.currentIndex,
         // style: Theme.of(context).bottomNavigationBarTheme,
          onTap: (index){
            cubit.changeIndex(index);
          },
        ),
         );
      },
    );
  }
}

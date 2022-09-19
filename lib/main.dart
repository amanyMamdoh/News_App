import 'dart:io';

import 'dart:ui';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/layout/homeLayout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/shared/blocObserver.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/network/local/cache_helper.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  Dio_Helper.init();
  await CacheHelper.init();
  bool? darkModefromCache=CacheHelper.getData(key: 'darkMode');

  BlocOverrides.runZoned(
        () {
      runApp(
          MaterialApp(
              home:  myApp(darkModefromCache)
          )
      );
    },
    blocObserver: MyBlocObserver(),
  );

}
class myApp extends StatelessWidget {
  bool? darkMode;
  myApp(this.darkMode);

  @override
  Widget build(BuildContext context) {
    return
      BlocProvider(
        create: (BuildContext context)=>
                     CubitNewsApp()..get_Business()
                       ..get_Sports()..get_Science()
                       ..changeMode(fromShared:darkMode ),
        child: BlocConsumer<CubitNewsApp,NewsAppState>(
          listener: ( context , State ) { },
          builder: (context , State ) {
            return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
            primarySwatch: Colors.green,
            //scaffoldBackgroundColor: Colors.white,
            appBarTheme: AppBarTheme(
            // backwardsCompatibility: false,
            elevation: 1,
            systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark

            ),
            iconTheme: IconThemeData(
            color: Colors.black
            ),
            titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold
            ),
            backgroundColor: Colors.white,
            //
            /*  */
            ),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
            type: BottomNavigationBarType.fixed,
            //  selectedItemColor: Colors.green,
            backgroundColor: Colors.green,

            ),
            textTheme: TextTheme(
            bodyText1: TextStyle(
            fontSize:18,
            fontWeight: FontWeight.w300,
            color: Colors.black

            )

            )
            //  bottomNavigationBarTheme:const  Bottom
            ),
            darkTheme:ThemeData(
                primarySwatch: Colors.green,
            //scaffoldBackgroundColor: Colors.white,
            appBarTheme: AppBarTheme(
            // backwardsCompatibility: false,
            elevation: 1,
            systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.black,
            statusBarIconBrightness: Brightness.light

            ),
            iconTheme: IconThemeData(
            color: Colors.white
            ),
            titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold
            ),
            backgroundColor:HexColor("606060"),
            //
            /*  */
            ),
            scaffoldBackgroundColor: HexColor('606060'),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.grey,
            backgroundColor: Colors.green,
            selectedIconTheme: IconThemeData(
            color:Colors.grey,
            size: 24,
            ),


            //activeColor:Colors.grey
            ),
            textTheme: TextTheme(
            bodyText1: TextStyle(
            fontSize:18,
            fontWeight: FontWeight.w300,
            color: Colors.white

            )

            )
            //  bottomNavigationBarTheme:const  Bottom


            ),
            themeMode: CubitNewsApp.get(context).darkMode? ThemeMode.dark
                                                         : ThemeMode.light,
            //  themeMode: CubitNewsApp.get(context).appmode,
            home: Home_layout()

            ,
            );

          }
        ),
      );
  }
}



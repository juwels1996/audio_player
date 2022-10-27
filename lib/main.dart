import 'package:audio_players/screen/song_main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Music app',
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
        home:SongMainScreen(),
        getPages:[
          GetPage(name: '/', page: ()=> const HomeScreen()),
          GetPage(name: '/song', page: ()=> const HomeScreen()),
          GetPage(name: '/playlist', page: ()=> const HomeScreen())
        ]
    );
  }
}


import 'package:audio_players/model/song_model.dart';
import 'package:audio_players/screen/playlist_screen.dart';
import 'package:audio_players/screen/song_main_screen.dart';
import 'package:audio_players/screen/song_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:just_audio_background/just_audio_background.dart';

import 'screen/home_screen.dart';

Future<void> main() async {
  await JustAudioBackground.init(
    androidNotificationChannelId: 'com.ryanheise.bg_demo.channel.audio',
    androidNotificationChannelName: 'Audio playback',
    androidNotificationOngoing: true,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final Song songss;
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Music app',
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
        home:HomeScreen(),
        getPages:[
          GetPage(name: '/', page: ()=> const HomeScreen()),
          GetPage(name: '/song', page: ()=>  SongMainScreen()),
          GetPage(name: '/playlist', page: ()=> HomeScreen())
        ]
    );
  }
}


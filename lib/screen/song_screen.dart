import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../model/song_model.dart';
class SongScreen extends StatelessWidget {
  const SongScreen({
    Key? key,
  required this.song,
  }) : super(key: key);

  final Song song;



  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.toNamed('/song',arguments: song);
      },
      child: Container(

        margin: EdgeInsets.only(right: 10),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              width: MediaQuery.of(context).size.width*0.45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(image: AssetImage(song.coverUrl
                ),
                  fit: BoxFit.cover
                ),
                color: Colors.white.withOpacity(0.8),

              ),
            ),
            Container(
              height: 72,
              width: MediaQuery.of(context).size.width*0.45,
              margin: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white.withOpacity(0.8),

              ),
              child:Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                      padding: EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Text(song.title,style: TextStyle(color: Colors.teal,fontWeight: FontWeight.bold,fontSize: 13),),
                      Text(song.description,style: TextStyle(color: Colors.teal),),
                      Icon(Icons.play_circle,color: Colors.deepPurple,)
                    ],
                  ),

                  )

                ],
              ) ,

            ),






          ],

        ),
      ),
    );
  }
}

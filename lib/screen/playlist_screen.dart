import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../model/play_list.dart';
 class PlayListScreen extends StatelessWidget {
   const PlayListScreen({
     Key?key,
   required this.playlist,

   }) : super (key: key);

     final PlayList playlist;

   @override

   Widget build(BuildContext context){
     return InkWell(
       onTap: (){
         Get.toNamed('page',arguments: playlist);
       },
       child: Container(
         height: 76,
         margin: EdgeInsets.only(bottom: 10),
         padding: EdgeInsets.symmetric(horizontal: 8),
         decoration: BoxDecoration(
           color: Colors.deepPurple.shade800.withOpacity(0.6),
         ),
         child:Row(
           mainAxisAlignment: MainAxisAlignment.spaceAround,
           children: [
             ClipRRect(
               borderRadius: BorderRadius.circular(15),
               child: Image.network(playlist.imagUrl,
                 height: 60,
                 width: 70,
                 fit: BoxFit.cover,
               ),
             ),
             SizedBox(width: 20,),
             Expanded(
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text(
                     playlist.title,
                     style: TextStyle(color: Colors.white),
                   ),
                   Text('${playlist.songs.length} songs',
                     maxLines: 3,
                     style: TextStyle(color: Colors.white),
                   ),

                 ],
               ),

             ),
             IconButton(onPressed: (){},
                 icon: Icon(Icons.play_circle,color: Colors.white,))
           ],
         ) ,

       ),
     );

   }



}
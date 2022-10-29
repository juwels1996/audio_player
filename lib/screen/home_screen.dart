import 'dart:ui';

import 'package:audio_players/screen/playlist_screen.dart';
import 'package:audio_players/screen/song_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';

import '../model/play_list.dart';
import '../model/song_model.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Song>songs=Song.songs;
    List<PlayList>playlists=PlayList.playlists;

    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.deepPurple.shade800.withOpacity(0.8),
              Colors.deepPurple.shade200
            ]
          )
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: _CustomerAppBar(),

          bottomNavigationBar: buildBottomNavigationBar(),




          body: SingleChildScrollView(
            child: Column(
              children: [
                DiscoverMusic(),
                TrendingMusic(context, songs),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("PlayList",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                      SizedBox(height: 8,),
                      ListView.builder(
                        shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: playlists.length,
                          itemBuilder: ((context,index){
                            return PlayListScreen(playlist:playlists[index],);


                      })
                      )


                    ]
                  ),
                )
              ],

            ),
          ),
        )
    );

  }



  Padding TrendingMusic(BuildContext context, List<Song> songs) {
    return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(

                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Text('Trending Music',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Text('View more ',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                        ),

                      ],
                    ),
                    SizedBox(height: 20,),
                    SizedBox(height:MediaQuery.of(context).size.height*0.27,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                        itemCount:songs.length ,
                        itemBuilder: (context,index){
                        return SongScreen(song: songs[index],);
                        }),
                    ),



                  ],
                ),
              );
  }

  Padding DiscoverMusic() {
    TextEditingController editingController = TextEditingController();
    final String title;
    final duplicateItems = List<String>.generate(10000, (i) => "Item $i");
    return Padding(
                padding: const EdgeInsets.all(22.0),
                child: Column(
                  children: [
                    Text("Welcome ",style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold),),
                    Text("Enjoy your desired music",style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold),),
                SizedBox(height: 12,),
                    TextFormField(
                      decoration: InputDecoration(
                        isDense: true,
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Search',
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)
                        )
                      ),

                    )
                  ],
                ),
              );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.purpleAccent,
            unselectedItemColor: Colors.teal,
            selectedItemColor: Colors.white,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: [
          BottomNavigationBarItem(icon: Icon(Icons.add_home),
          label: 'Home'
          ),
          BottomNavigationBarItem(icon: Icon(Icons.add_home),
          label: 'Playlist'
          ),
          BottomNavigationBarItem(icon: Icon(Icons.add_home),
              label: 'Favourite'
          ),
          BottomNavigationBarItem(icon: Icon(Icons.add_home),
              label: 'Profile'
          ),
        ]);
  }

  }
class _CustomerAppBar extends StatelessWidget with PreferredSizeWidget{
  const _CustomerAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: Icon(Icons.music_note),
      actions: [
        Container(
          margin: EdgeInsets.only(right: 20),
          child: CircleAvatar(
            backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_ZlzxZR4YL7MHb9E03h64--NCKTKfiVi-xkZ6yKaE&s"),
          ),
          
        )
      ],

  
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(56.0);
}


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:rxdart/rxdart.dart' as rxdart;

import '../model/song_model.dart';
import '../widget/seek_bar.dart';
class SongMainScreen extends StatefulWidget {
  const SongMainScreen({Key? key}) : super(key: key);

  @override
  _SongMainScreenState createState() => _SongMainScreenState();
}

class _SongMainScreenState extends State<SongMainScreen> {
  Song song=Get.arguments ??  Song.songs[0];
  AudioPlayer audioPlayer=AudioPlayer();
  bool offline =false;
  bool fromDownloads=false;

  @override
  void initState(){
    audioPlayer.setAudioSource(
        ConcatenatingAudioSource(
            children: [
          AudioSource.uri(
              Uri.parse('${song.url}'),

            tag: MediaItem(
              id: '${'${Song.songs[0].url}'}',
              album: "${'asset:///${song.coverUrl}'}",
              title: "${'asset:///${song.title}'}",
              artUri: Uri.parse('assets/images/dark.jpg'),
            ),
          ),
              AudioSource.uri(
                Uri.parse('${Song.songs[1].url}'),
                tag: MediaItem(
                  id: '${Song.songs[1].url}',
                  album:'${Song.songs[1].coverUrl}',
                  title: '${Song.songs[1].title}',
                  artUri: Uri.parse('assets/images/caught.jpg'),
                ),
              ),
              AudioSource.uri(
                Uri.parse('${Song.songs[2].url}'),
                tag: MediaItem(
                  id: '${Song.songs[2].url}',
                  album:'${Song.songs[2].coverUrl}',
                  title: '${Song.songs[2].title}',
                  artUri: Uri.parse('assets/images/dark.jpg'),
                ),
              ),
        ]
        ));


    super.initState();
  }

  @override
  void dispose(){
    audioPlayer.dispose();
    super.dispose();
  }

  Stream<SeekBarData>get _seekBarDataStream =>
      rxdart.Rx.combineLatest2<Duration,Duration?, SeekBarData>(
          audioPlayer.positionStream,
          audioPlayer.durationStream,
              (Duration position,Duration?duration)

          {
            return SeekBarData(position, duration?? Duration.zero);
          }

      );


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,

      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            song.coverUrl,
          fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(song.title,style: TextStyle(color: Colors.teal,fontWeight: FontWeight.bold,fontSize: 16),),
                Text(song.description,style: TextStyle(color: Colors.teal),),




                StreamBuilder<SeekBarData>(
                  stream: _seekBarDataStream,

                    builder: (context, Asyncsnapshot) {
                      final positionData=Asyncsnapshot.data;
                      return SeekBar(
                        position: positionData?.position ?? Duration.zero,
                          duration: positionData?.duration ?? Duration.zero,
                        onChanged: audioPlayer.seek,
                      );
                    }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    StreamBuilder<SequenceState?>
                      (
                      stream:audioPlayer.sequenceStateStream,

                        builder: (context,index){
                        return IconButton(
                            onPressed: audioPlayer.hasPrevious? audioPlayer.seekToPrevious:null,
                            iconSize: 45,
                            icon:Icon(Icons.skip_previous));
                        }),
                    StreamBuilder<PlayerState>(
                        stream: audioPlayer.playerStateStream,
                        builder: (context,Asyncsnapshot){
                          if(Asyncsnapshot.hasData){
                            final playerState=Asyncsnapshot.data;
                            final processingState=playerState!.processingState;

                            if(processingState==ProcessingState.loading||
                                processingState==ProcessingState.buffering)
                            {
                              return Container(
                                width: 64.0,
                                height: 64.0,
                                margin: EdgeInsets.all(10),
                                child: CircularProgressIndicator(

                                ),
                              );


                            }
                            else if(!audioPlayer.playing){
                              return IconButton(
                                  iconSize: 50,
                                  onPressed:audioPlayer.play,
                                  icon: Icon(Icons.play_circle,color: Colors.white,)
                              );

                            }
                            else if
                              (processingState!=ProcessingState.completed){
                              return IconButton(
                                  iconSize: 50,
                                  onPressed:audioPlayer.pause,
                                  icon: Icon(
                                    Icons.pause_circle,
                                    color: Colors.white,)
                              );
                            }
                            else{
                              return IconButton(
                                  iconSize: 50,
                                  onPressed:()=>audioPlayer.seek(Duration.zero,index:audioPlayer.effectiveIndices!.
                                  first),
                                  icon: Icon(
                                    Icons.reply_all,
                                    color: Colors.white,)
                              );

                            }
                          }
                          else{
                            return CircularProgressIndicator();
                          }
                        }),

                    StreamBuilder<SequenceState?>
                      (
                        stream:audioPlayer.sequenceStateStream,

                        builder: (context,index){
                          return IconButton(
                              onPressed: audioPlayer.hasNext? audioPlayer.seekToNext:null,
                              iconSize: 45,
                              icon:Icon(Icons.skip_next)
                          );
                        }),
                  ],
                ),
                SizedBox(height: 12,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: audioPlayer.hasNext? audioPlayer.seekToNext:null,
                        iconSize: 30,
                        icon:Icon(Icons.settings)
                    ),
                  ],
                )
              ],
            ),
          ),
          
        ],

      ),
    );
  }
}



import 'package:audio_players/model/song_model.dart';

class PlayList{
  final String title;
  final List<Song>songs;
  final String imagUrl;

  PlayList({required this.title,required this.songs,required this.imagUrl});

  static List<PlayList>playlists=[
    PlayList(title: 'Chiro Odhora',
        songs:Song.songs,
        imagUrl: 'https://blogger.googleusercontent.com/img/a/AVvXsEgzjwe5DMzyunHMneA1j90cLl1iuADis0ywZDXUokgLncaifu3uhcRWpuWXGxf7xXe7rLF2Y2E5JzOTrDJGXA6om6fzueUBl_ZA4Ax6v8qyxNgXkLmFp3PqtfRvy3uljud29HsLRN-X2RZRqI69sV9b_SF4_E6V4E5WcJgNN2c1bQNKQX-5QVgYgjyW=s16000'),
    PlayList(title: 'Agar sath hum',
        songs:Song.songs,
        imagUrl: 'https://i.ytimg.com/vi/xRb8hxwN5zc/maxresdefault.jpg'),
    PlayList(title: 'tere sang yaara',
        songs:Song.songs,
        imagUrl: 'https://c-fa.cdn.smule.com/rs-s-sf-1/arr/5e/b0/d8afa77e-dd03-4a6a-94ff-e68ad270de4f_1024.jpg'),

  ];
}
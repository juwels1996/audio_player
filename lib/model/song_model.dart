class Song{
  final String title;
  final String description;
  final String url;
  final String coverUrl;
  Song({
    required this.title,
    required this.description,
    required this.url,
    required this.coverUrl
});
  static List<Song>songs=[
    Song(
        title: 'first song',
        description: 'Hindi song',
        url: 'assets/music/one.mp3',
        coverUrl: 'assets/images/first1.jpg'),
    Song(title: 'second song',
        description: 'Hindi song',
        url: 'https://www.harlancoben.com/audio/DarkestFear2minExtract.mp3',
        coverUrl: 'assets/images/second2.jpg'),
    Song(title: 'third song',
        description: 'Hindi song',
        url: 'assets/music/third.mp3',
        coverUrl: 'assets/images/third3.jpg'),
  ];
}
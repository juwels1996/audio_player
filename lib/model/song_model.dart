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
        title: 'Darkest fair ',
        description: 'Audio Book',
        url: 'https://www.harlancoben.com/audio/CaughtSample.mp3',
        coverUrl: 'assets/images/dark.jpg'),

    Song(title: 'Caught',
        description: 'Audio Book',
        url: 'https://www.harlancoben.com/audio/DarkestFear2minExtract.mp3',
        coverUrl: 'assets/images/caught.jpg'),
    Song(title: 'Gone for good',
        description: 'Audio Book',
        url: 'https://www.harlancoben.com/audio/HoldTight.mp3',
        coverUrl: 'assets/images/gone.jpg'),
  ];
}
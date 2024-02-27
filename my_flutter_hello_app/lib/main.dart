import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestion de Médias',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  Set<LikedMedia> _likedMedia = {}; 

  final List<Widget> _pages = [
    Center(child: Text('Bienvenue dans l\'application de gestion de médias!')),
    MediaPage(
      likedMediaCallback: (LikedMedia likedMedia) {
        setState(() {
          _likedMedia.add(likedMedia);
        });
      },
    ),
    LikedMediaPage(likedMedia: []),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Accueil'),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Média',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Liked Média',
          ),
        ],
      ),
    );
  }
}

class MediaType {
  final String name;
  final List<MediaItem> mediaItems;

  MediaType({required this.name, required this.mediaItems});
}

class MediaItem {
  final String title;
  final String description;
  final String imageUrl;

  MediaItem({required this.title, required this.description, required this.imageUrl});
}

class MediaPage extends StatelessWidget {
  final List<MediaType> mediaTypes = [
    MediaType(
      name: 'Movies',
      mediaItems: [
        MediaItem(
          title: 'Movie 1',
          description: 'Description for Movie 1',
          imageUrl: 'https://example.com/movie1.jpg',
        ),
        MediaItem(
          title: 'Movie 2',
          description: 'Description for Movie 2',
          imageUrl: 'https://example.com/movie2.jpg',
        ),
      ],
    ),
    MediaType(
      name: 'Books',
      mediaItems: [
        MediaItem(
          title: 'Book 1',
          description: 'Description for Book 1',
          imageUrl: 'https://example.com/book1.jpg',
        ),
        MediaItem(
          title: 'Book 2',
          description: 'Description for Book 2',
          imageUrl: 'https://example.com/book2.jpg',
        ),
      ],
    ),
    // Add more media types as needed
  ];

  final Function(LikedMedia) likedMediaCallback;

  MediaPage({required this.likedMediaCallback});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: mediaTypes.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(mediaTypes[index].name),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MediaSubListPage(
                  mediaType: mediaTypes[index],
                  likedMediaCallback: likedMediaCallback,
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class MediaSubListPage extends StatelessWidget {
  final MediaType mediaType;
  final Function(LikedMedia) likedMediaCallback;

  MediaSubListPage({required this.mediaType, required this.likedMediaCallback});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mediaType.name),
      ),
      body: ListView.builder(
        itemCount: mediaType.mediaItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(mediaType.mediaItems[index].title),
            subtitle: Text(mediaType.mediaItems[index].description),
            leading: Image.network(mediaType.mediaItems[index].imageUrl),
            trailing: IconButton(
              icon: Icon(Icons.favorite),
              onPressed: () {
                LikedMedia likedMedia = LikedMedia(
                  title: mediaType.mediaItems[index].title,
                  description: mediaType.mediaItems[index].description,
                  imageUrl: mediaType.mediaItems[index].imageUrl,
                );
                likedMediaCallback(likedMedia);
              },
            ),
          );
        },
      ),
    );
  }
}

class LikedMedia {
  final String title;
  final String description;
  final String imageUrl;

  LikedMedia({required this.title, required this.description, required this.imageUrl});
}

class LikedMediaPage extends StatelessWidget {
  final Set<LikedMedia> likedMedia;

  LikedMediaPage({required this.likedMedia});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: likedMedia.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(likedMedia.elementAt(index).title),
          subtitle: Text(likedMedia.elementAt(index).description),
          leading: Image.network(likedMedia.elementAt(index).imageUrl),
        );
      },
    );
  }
}

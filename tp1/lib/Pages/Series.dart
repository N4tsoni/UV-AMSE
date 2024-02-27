import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tp1/ClassMedia/Media.dart';
import 'package:tp1/Fonctionnalitées/towatch.dart';
import 'package:tp1/Fonctionnalitées/Favories.dart';
import 'package:tp1/Pages/bd.dart';
import 'package:tp1/Pages/docu.dart';
import 'package:tp1/Pages/Favories.dart';
import 'package:tp1/Pages/film.dart';
import 'package:tp1/Pages/Home.dart';
import 'package:tp1/Pages/towatch.dart';
import 'package:tp1/Pages/Series.dart';



class SeriesPage extends StatelessWidget {
  static const routeName = 'series_page';
  static const fullPath = '/$routeName';

  const SeriesPage({Key? key});

  @override
  Widget build(BuildContext context) {
    final List<Media> MediaList = [
      Media(
        id: 31,
        title: 'Black Mirror',
        description: 'David Slade',
        imageUrl: 'assets/series/BlackMirror.jpg',
      ),
      Media(
        id: 32,
        title: 'Breaking Bad',
        description: 'Vince Gilligan',
        imageUrl: 'assets/series/BreakingBad.jpg',
      ),
      Media(
        id: 33,
        title: 'Chernobyl',
        description: 'Johan Renck',
        imageUrl: 'assets/series/Chernobyl.jpg',
      ),
      Media(
        id: 34,
        title: 'Downton Abbey',
        description: 'Michael Engler',
        imageUrl: 'assets/series/DowntownAbbey.jpg',
      ),
      Media(
        id: 35,
        title: 'Godless',
        description: 'Scott Frank',
        imageUrl: 'assets/series/Godless.jpg',
      ),
      Media(
        id: 36,
        title: '1883',
        description: 'Taylor Shéridan',
        imageUrl: 'assets/series/Millehuitcentquatrevingttrois.jpg',
      ),
      Media(
        id: 37,
        title: 'MindHunter',
        description: 'David Fincher',
        imageUrl: 'assets/series/MindHunter.jpg',
      ),
      Media(
        id: 38,
        title: 'Peaky Blinders',
        description: 'Steven Knight',
        imageUrl: 'assets/series/PeakyBlinders.jpg',
      ),
      Media(
        id: 39,
        title: 'Queen\'s gambit',
        description: 'Allan Scott et Scott Frank',
        imageUrl: 'assets/series/QueenGambit.jpg',
      ),
      Media(
        id: 40,
        title: 'Sambre',
        description: 'Jean Xavier de Lestrade',
        imageUrl: 'assets/series/Sambre.jpg',
      ),
      Media(
        id: 40,
        title: 'Severance',
        description: 'Ben Stiller et Aoife McArdle',
        imageUrl: 'assets/series/Severance.jpg',
      ),
      Media(
        id: 41,
        title: 'Sherlock',
        description: 'Steven Moffat et Mark Gatiss ',
        imageUrl: 'assets/series/Sherlock.jpg',
      ),
      Media(
        id: 42,
        title: 'The Sopranos',
        description: ' Tim Van Patten, John Patterson, Allen Coulter et Alan Taylor',
        imageUrl: 'assets/series/Sopranos.jpg',
      ),
      Media(
        id: 43,
        title: 'The Boys',
        description: 'Eric Kripke',
        imageUrl: 'assets/series/TheBoys.jpg',
      ),
      Media(
        id: 44,
        title: 'True Detective',
        description: 'Cary Fukunaga',
        imageUrl: 'assets/series/TrueDetective.jpg',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Séries',
          style: TextStyle(
            fontFamily: "PlayfairDisplay",
          ),
        ),
        backgroundColor: Colors.red[900],
      ),
      body: ListView.builder(
        itemCount: MediaList.length, 
        cacheExtent: 20.0,
        controller: ScrollController(),
        padding: const EdgeInsets.symmetric(vertical: 16),
        itemBuilder: (context, index) => ItemTile(MediaList[index]), 
      ),
    );
  }
}

class ItemTile extends StatelessWidget {
  final Media media;

  const ItemTile(this.media);

  @override
  Widget build(BuildContext context) {
    final FavoriesList = context.watch<Favories>();
    final towatchList = context.watch<Towatch>();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: Container(
          width: 50, 
          height: 50, 
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(media.imageUrl), 
              fit: BoxFit.cover, 
            ),
          ),
        ),
        title: Text(
          media.title,
          key: Key('text_${media.id}'), 
          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            fontFamily: "PlayfairDisplay",
                            color: Colors.black,
                        ),
        ),
        subtitle: Text(
          media.description,
          style: TextStyle(
                            fontSize: 12,
                            fontFamily: "PlayfairDisplay",
                        ), 
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            IconButton(
              key: Key('favorite_icon_${media.id}'),
              icon: FavoriesList.items.contains(media)
                  ? const Icon(Icons.favorite)
                  : const Icon(Icons.favorite_border),
              onPressed: () {
                !FavoriesList.items.contains(media)
                    ? FavoriesList.add(media) 
                    : FavoriesList.remove(media); 
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(FavoriesList.items.contains(media)
                        ? 'Added to Favories.'
                        : 'Removed from Favories.'),
                    duration: const Duration(seconds: 1),
                  ),
                );
              },
            ),
            IconButton(
              key: Key('towatch_icon_${media.id}'),
              icon: towatchList.items.contains(media)
                  ? const Icon(Icons.add_to_photos)
                  : const Icon(Icons.add_to_photos_outlined),
              onPressed: () {
                !towatchList.items.contains(media)
                    ? towatchList.add(media) 
                    : towatchList.remove(media);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(towatchList.items.contains(media)
                        ? 'Added to Watch.'
                        : 'Removed from watch.'),
                    duration: const Duration(seconds: 1),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
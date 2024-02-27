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


class DocuPage extends StatelessWidget {
  static const routeName = 'docu_page';
  static const fullPath = '/$routeName';

  const DocuPage({Key? key});

  @override
  Widget build(BuildContext context) {
    final List<Media> MediaList = [
      Media(
        id: 50,
        title: 'Black Fish',
        description: 'Gabriela Cowperthwaite',
        imageUrl: 'assets/docu/BlackFish.jpg',
      ),
      Media(
        id: 51,
        title: 'Cosmos',
        description: 'AD.Ann Druyan, BB.Brannon Braga, BP.Bill Pope.',
        imageUrl: 'assets/docu/Cosmos.jpg',
      ),
      Media(
        id: 52,
        title: 'Etugen',
        description: 'Arnaud Riou',
        imageUrl: 'assets/docu/Etugen.jpg',
      ),
      Media(
        id: 53,
        title: 'Made in America',
        description: 'Ezra Edelman',
        imageUrl: 'assets/docu/MadeInAmerica.jpg',
      ),
      Media(
        id: 54,
        title: 'Our Planet',
        description: 'Alastair Fothergill',
        imageUrl: 'assets/docu/OurPlanet.jpg',
      ),
      Media(
        id: 55,
        title: 'Planet Earth',
        description: 'David Attenborough',
        imageUrl: 'assets/docu/PlanetEarth.jpg',
      ),
      Media(
        id: 56,
        title: 'Radiohead In Rainbows, From The Basement',
        description: 'Benjamin Clavel',
        imageUrl: 'assets/docu/RadioHead.jpg',
      ),
      Media(
        id: 57,
        title: 'Sacerdoce',
        description: 'Damien Boyer',
        imageUrl: 'assets/docu/Sacerdoce.jpg',
      ),
      Media(
        id: 58,
        title: 'Stop Making Sense',
        description: 'Jonathan Demme',
        imageUrl: 'assets/docu/StopMakingSense.jpg',
      ),
      Media(
        id: 59,
        title: 'Sugar Man (Searching for Sugar Man)',
        description: 'Malik Bendjelloul',
        imageUrl: 'assets/docu/SugarMan.jpg',
      ),
      Media(
        id: 60,
        title: 'Suspendu, Des soignants entre deux mondes',
        description: 'Fabien Moine',
        imageUrl: 'assets/docu/Suspendus.jpg',
      ),
      Media(
        id: 61,
        title: 'The Wire',
        description: 'Tiha K.Gudac',
        imageUrl: 'assets/docu/TheWire.jpg',
      ),
      Media(
        id: 62,
        title: 'Le Monde en guerre',
        description: 'David Elstein',
        imageUrl: 'assets/docu/TheWorldAtWar.jpg',
      ),
      Media(
        id: 63,
        title: 'Tous résistants dans l’âme',
        description: 'Stephane Chatry',
        imageUrl: 'assets/docu/Tousresistants.jpg',
      ),
      
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Documentaires',
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
                    content: Text(FavoriesList.items.contains(Media)
                        ? 'Added to Favories.'
                        : 'Removed from Favories.'),
                    duration: const Duration(seconds: 1),
                  ),
                );
              },
            ),
            IconButton(
              key: Key('towatch_icon_${media.id}'),
              icon: towatchList.items.contains(Media)
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
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



class FilmPage extends StatelessWidget {
  static const routeName = 'film_page';
  static const fullPath = '/$routeName';

  const FilmPage({Key? key});

  @override
  Widget build(BuildContext context) {
    final List<Media> MediaList = [
      Media(
        id: 1,
        title: 'Star Wars 4',
        description: 'George Lucas ',
        imageUrl: 'assets/films/StarWarsMoviePoster1977.jpg',
      ),
      Media(
        id: 2,
        title: 'Star Wars 5',
        description: 'George Lucas',
        imageUrl: 'assets/films/The_Empire_Strikes_Back_(1980_film).jpg',
      ),
      Media(
        id: 3,
        title: 'Star Wars 6',
        description: 'George Lucas',
        imageUrl: 'assets/films/ReturnOfTheJediPoster1983.jpg',
      ),
      Media(
        id: 4,
        title: 'Casablanca',
        description: 'Michael Curtiz',
        imageUrl: 'assets/films/Casablanca.jpg',
      ),
      Media(
        id: 5,
        title: 'Citizen Kane',
        description: 'Orson Welles',
        imageUrl: 'assets/films/CitizenKane.jpg',
      ),
      Media(
        id: 6,
        title: 'Do the right thing',
        description: 'Spike Lee',
        imageUrl: 'assets/films/DoTheRightThing.jpg',
      ),
      Media(
        id: 7,
        title: 'Et pour quelques dollars de plus',
        description: 'Sergio Leone',
        imageUrl: 'assets/films/Fewdollars.jpg',
      ),
      Media(
        id: 8,
        title: 'Goodfellas',
        description: 'Martin Scorsese',
        imageUrl: 'assets/films/Goodfellas.jpg',
      ),
      Media(
        id: 9,
        title: 'Harakiri',
        description: 'Masaki Kobayashi',
        imageUrl: 'assets/films/Harakiri.jpg',
      ),
      Media(
        id: 10,
        title: 'In the Mood for Love',
        description: 'Wong Kar wai',
        imageUrl: 'assets/films/InTheMoodForLove.jpg',
      ),
      Media(
        id: 11,
        title: 'M le maudit',
        description: 'Fritz Lang',
        imageUrl: 'assets/films/MLeMaudit.jpg',
      ),
      Media(
        id: 12,
        title: 'Once Upon a Time in America',
        description: 'Sergio Leone',
        imageUrl: 'assets/films/OnceUponaTimeinAmerica.jpg',
      ),
      Media(
        id: 13,
        title: 'Once Upon a Time in Hollywood',
        description: 'Quentin Tarantino',
        imageUrl: 'assets/films/OnceUponaTimeinHollywood.jpg',
      ),
      Media(
        id: 13,
        title: 'Once Upon a Time in the West',
        description: 'Sergio Leone',
        imageUrl: 'assets/films/OnceUponaTimeintheWest.jpg',
      ),
      Media(
        id: 14,
        title: 'Once Upon a Time ... the Revolution',
        description: 'Sergio Leone',
        imageUrl: 'assets/films/OnceUponaTimeRevolution.jpg',
      ),
      Media(
        id: 15,
        title: 'Parrain 1',
        description: 'Francis Ford Coppola',
        imageUrl: 'assets/films/Parrain1.jpg',
      ),
      Media(
        id: 16,
        title: 'Parrain 2',
        description: 'Francis Ford Coppola',
        imageUrl: 'assets/films/Parrain2.jpg',
      ),
      Media(
        id: 17,
        title: 'Platoon',
        description: 'Oliver Stone',
        imageUrl: 'assets/films/Platoon.jpg',
      ),
      Media(
        id: 18,
        title: 'Pshychose',
        description: 'Alfred Hitchcock',
        imageUrl: 'assets/films/Pshycho.jpg',
      ),
      Media(
        id: 19,
        title: 'Ran',
        description: 'Akira Kurosawa',
        imageUrl: 'assets/films/Ran.jpg',
      ),
      Media(
        id: 20,
        title: 'Taxi Driver',
        description: 'Martin Scorsese',
        imageUrl: 'assets/films/Taxidriver.jpg',
      ),
      Media(
        id: 21,
        title: 'Le Bon, la Brute et le Truand',
        description: 'Sergio Leone',
        imageUrl: 'assets/films/TheGoodBadUgly.jpg',
      ),
      Media(
        id: 22,
        title: 'Twin Peaks',
        description: 'David Lynch, Lesli Linka Glatter, Caleb Deschanel',
        imageUrl: 'assets/films/TwinPeaks.jpg',
      ),
      Media(
        id: 23,
        title: 'Vertigo',
        description: 'Alfred Hitchcock',
        imageUrl: 'assets/films/Vertigo.jpg',
      ),
      
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Films',
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
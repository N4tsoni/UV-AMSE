import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tp1/ClassMedia/Media.dart';
import 'package:tp1/Fonctionnalitées/Favories.dart';
import 'package:tp1/Pages/bd.dart';
import 'package:tp1/Pages/docu.dart';
import 'package:tp1/Pages/Favories.dart';
import 'package:tp1/Pages/film.dart';
import 'package:tp1/Pages/Home.dart';
import 'package:tp1/Pages/towatch.dart';
import 'package:tp1/Pages/Series.dart';



class HomePage extends StatelessWidget {
  static const routeName = '/';
  static const fullPath = '/$routeName';

  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'POPBOX',
          style: TextStyle(
            fontFamily: "PlayfairDisplay",
            fontSize: 30,
          ),
        ),
        backgroundColor: Colors.red[900],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.red[900],
        elevation: 10,
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(Icons.movie, size: 30),
                onPressed: () {
                  context.go(FilmPage.fullPath);
                },
              ),
              IconButton(
                icon: Icon(Icons.tv, size: 30),
                onPressed: () {
                  context.go(SeriesPage.fullPath);
                },
              ),
              SizedBox(width: 40), // Ajout d'un espace entre les icônes
              IconButton(
                icon: Icon(Icons.library_books, size: 30),
                onPressed: () {
                  context.go(DocuPage.fullPath);
                },
              ),
              IconButton(
                icon: Icon(Icons.book, size: 30),
                onPressed: () {
                  context.go(BdPage.fullPath);
                },
              ),
              IconButton(
                icon: Icon(Icons.favorite, size: 30),
                onPressed: () {
                  context.go(FavoriesPage.fullPath);
                },
              ),
              IconButton(
                icon: Icon(Icons.visibility, size: 30),
                onPressed: () {
                  context.go(TowatchPage.fullPath);
                },
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 80),
              MediaSelection(),
            ],
          ),
        ),
    );
  }
}

class MediaSelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int totalObjects = 8;
    int initialObjects = totalObjects ~/ 2;

    return Container(
      height: 300,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [const Color.fromARGB(255, 75, 6, 1), Color.fromARGB(255, 185, 72, 6)],
        ),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (int i = 0; i < totalObjects; i++)
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                width: MediaQuery.of(context).size.width / initialObjects, // Ajustez la largeur en fonction du nombre initial d'objets
                child: Stack(
                  children: [
                    // Image
                    Image.network(
                      'https://example.com/your-image-url.jpg',
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                    // Text overlay
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        color: Colors.black.withOpacity(0.5),
                        padding: EdgeInsets.all(8),
                        child: Text(
                          'Your Text Here \nNumber $i',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

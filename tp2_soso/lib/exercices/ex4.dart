import 'package:flutter/material.dart';
import 'package:tp2_soso/classes/classe_exercice.dart';

class Tile {
  String path;
  Alignment alignment;

  Tile({required this.path, required this.alignment});

  Widget croppedImageTile() {
    return FittedBox(
      fit: BoxFit.fill,
      child: ClipRect(
        child: Container(
          child: Align(
            alignment: this.alignment,
            widthFactor: 0.5,
            heightFactor: 0.5,
            child: Image.asset(this.path),
          ),
        ),
      ),
    );
  }
}

Tile tile = new Tile(
    path: 'gojo.png', alignment: Alignment(0, 0));

class Ex4 extends StatelessWidget {
  final Exercice exercice;

  const Ex4({Key? key, required this.exercice}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Center(
        child: Column(
          children: [
            SizedBox(
              width: 150.0,
              height: 150.0,
              child: Container(
                margin: EdgeInsets.all(20.0),
                child: createTileWidget(),
              ),
            ),
            Container(
              height: 200,
              child: Image.asset('gojo.png',
                  fit: BoxFit.cover),
            ),
          ],
        ),
        ),
      ),
    );
  }
  Widget createTileWidget() {
    return InkWell(
      child: tile.croppedImageTile(),
      onTap: () {
        print("BRAVOOOO");
      },
    );
  }
  AppBar _buildAppBar() {
  return AppBar(
    title: Text(
      'Exercice 4: Afficher une tuile',
      style: TextStyle(
        fontFamily: "PlayfairDisplay",
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    flexibleSpace: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.red[900]!, const Color.fromARGB(255, 216, 230, 25)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
    ),
  );
}
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp2_soso/classes/classe_exercice.dart';

class Tile {
  String path;
  Alignment alignment;
  double widthFactor;
  double heightFactor;

  Tile({
    required this.path,
    required this.alignment,
    this.widthFactor = 1.0,
    this.heightFactor = 1.0,
  });

  Widget croppedImageTile() {
    return FittedBox(
      fit: BoxFit.fill,
      child: ClipRect(
        child: Container(
          child: Align(
            alignment: this.alignment,
            widthFactor: this.widthFactor,
            heightFactor: this.heightFactor,
            child: Image.asset(this.path),
          ),
        ),
      ),
    );
  }
}

class Ex5c extends StatefulWidget {
  final Exercice exercice;

  const Ex5c({Key? key, required this.exercice}) : super(key: key);

  @override
  _Ex5cState createState() => _Ex5cState();
}

class _Ex5cState extends State<Ex5c> {
  double _currentSliderValue = 3;
  List<Tile> tiles = [];

  @override
  Widget build(BuildContext context) {
    int numberOfTiles = (_currentSliderValue * _currentSliderValue).toInt();

    tiles = generateTiles(_currentSliderValue.toInt());

    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                height: 500,
                width: 500,
                child: GridView.count(
                  primary: false,
                  padding: const EdgeInsets.all(1),
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 1,
                  crossAxisCount: _currentSliderValue.toInt(),
                  children: tiles.map((tile) {
                    return Container(
                      padding: const EdgeInsets.all(1),
                      child: tile.croppedImageTile(),
                    );
                  }).toList(),
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Taille: ',
                    style: TextStyle(
                      fontFamily: "PlayfairDisplay",
                      fontSize: 18,
                    ),
                  ),
                ),
                Expanded(
                  child: Slider(
                    value: _currentSliderValue,
                    min: 1,
                    max: 10,
                    divisions: 9, 
                    label: _currentSliderValue.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _currentSliderValue = value;
                        tiles = generateTiles(_currentSliderValue.toInt()); 
                      });
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  AppBar _buildAppBar() {
  return AppBar(
    title: Text(
      'Exercice 5C: Configuration plateau taquin',
      style: TextStyle(
        fontFamily: "PlayfairDisplay",
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    flexibleSpace: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.red[900]!, const Color.fromARGB(255, 216, 230, 25)!],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
    ),
  );
}

  List<Tile> generateTiles(int sliderValue) {
    if (sliderValue == 1) {
      return [
        Tile(
          path: 'JJK.jpg',
          alignment: Alignment.center,
          widthFactor: 1.0,
          heightFactor: 1.0,
        )
      ]; 
    }

    List<Tile> tiles = [];
    double factor = 1.0 / sliderValue;
    for (int i = 0; i < sliderValue * sliderValue; i++) {
      int rowIndex = i ~/ sliderValue;
      int colIndex = i % sliderValue;
      double alignmentX = -1 + (colIndex * 2) / (sliderValue - 1);
      double alignmentY = -1 + (rowIndex * 2) / (sliderValue - 1);
      tiles.add(Tile(
        path: 'JJK.jpg',
        alignment: Alignment(alignmentX, alignmentY),
        widthFactor: factor, 
        heightFactor: factor, 
      ));
    }
    return tiles;
  }
}

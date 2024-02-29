import 'dart:math';
import 'package:flutter/material.dart';
import 'package:tp2_soso/classes/classe_exercice.dart';

Color generateRandomColor() {
  Random random = Random();
  return Color.fromRGBO(
    random.nextInt(256),
    random.nextInt(256),
    random.nextInt(256),
    1.0,
  );
}

class Ex5a extends StatelessWidget {
  final Exercice exercice;

  const Ex5a({Key? key, required this.exercice}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Center(
        child: Container(
            height: 500, 
            width: 500,
            child: GridView.count(
            primary: false,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 3,
        children: List.generate(9, (index) {
          Color randomColor = generateRandomColor();
          return Container(
            padding: const EdgeInsets.all(8),
            color: randomColor,
            child: Center(child: Text(
                'Tuile ${index + 1}', 
                style: TextStyle(color: Colors.white),
                ),
            ),
          );
        }),
        ),
      ),
    ),
    );
  }
  AppBar _buildAppBar() {
  return AppBar(
    title: Text(
      'Exercice 5A: Plateau de couleur',
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
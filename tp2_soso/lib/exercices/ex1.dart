import 'package:flutter/material.dart';
import 'package:tp2_soso/classes/classe_exercice.dart';

class Ex1 extends StatelessWidget {
  final Exercice exercice;

  const Ex1({Key? key, required this.exercice}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Center(
        child: Image.asset(
          'bob.jpg',
          width: 300,
          height: 500,
        ),
      ),
    );
  }
  AppBar _buildAppBar() {
  return AppBar(
    title: Text(
      'Exercice 1: Afficher une image',
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
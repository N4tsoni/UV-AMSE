import 'package:flutter/material.dart';
import 'package:my_flutter_hello_app/lib/Médias/Média.dart' 

class Liked extends ChangeNotifier {
  final List<Media> _favoriteItems = [];

  List<Media> get items => _favoriteItems;

  void add(Media contenus) {
    _favoriteItems.add(contenus);
    notifyListeners();
  }

  void remove(Contenus contenus) {
    _favoriteItems.remove(contenus);
    notifyListeners();
  }
}


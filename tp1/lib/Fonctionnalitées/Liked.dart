import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp1/ClassMedia/Media.dart';

class Favories extends ChangeNotifier {
  final List<Media> _favoriteItems = [];

  List<Media> get items => _favoriteItems;

  void add(Media Media) {
    _favoriteItems.add(Media);
    notifyListeners();
  }

  void remove(Media Media) {
    _favoriteItems.remove(Media);
    notifyListeners();
  }
}
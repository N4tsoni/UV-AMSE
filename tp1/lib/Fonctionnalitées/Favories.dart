import 'package:flutter/material.dart';
import 'package:tp1/ClassMedia/Media.dart';

class Favories extends ChangeNotifier {
  final List<Media> _favoriteItems = [];

  List<Media> get items => _favoriteItems;

  void add(Media media) {
    _favoriteItems.add(media);
    notifyListeners();
  }

  void remove(Media media) {
    _favoriteItems.remove(media);
    notifyListeners();
  }
}
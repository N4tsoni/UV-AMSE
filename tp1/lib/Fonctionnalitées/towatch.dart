import 'package:tp1/ClassMedia/Media.dart';
import 'package:flutter/material.dart';

class Towatch extends ChangeNotifier {
  final List<Media> _towatchItems = [];

  List<Media> get items => _towatchItems;

  void add(Media media) {
    _towatchItems.add(media);
    notifyListeners();
  }

  void remove(Media media) {
    _towatchItems.remove(media);
    notifyListeners();
  }
}
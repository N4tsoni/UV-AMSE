import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class Media {
  final int id;
  final String title;
  final String description;
  final String imageUrl;

  Media({required this.id, required this.title, required this.description, required this.imageUrl});
}
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tp1/ClassMedia/Media.dart';
import 'package:tp1/Fonctionnalitées/towatch.dart';
import 'package:tp1/Fonctionnalitées/Favories.dart';
import 'package:tp1/Pages/bd.dart';
import 'package:tp1/Pages/docu.dart';
import 'package:tp1/Pages/Favories.dart';
import 'package:tp1/Pages/film.dart';
import 'package:tp1/Pages/Home.dart';
import 'package:tp1/Pages/towatch.dart';
import 'package:tp1/Pages/Series.dart';

class TowatchPage extends StatelessWidget {
  static const routeName = 'towatch_page';
  static const fullPath = '/$routeName';

  const TowatchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'À regarder',
          style: TextStyle(                        
                fontFamily: "PlayfairDisplay",
          ),
        ),
        backgroundColor: Colors.red[900],
      ),
      body: Consumer<Towatch>(
        builder: (context, value, child) => value.items.isNotEmpty
            ? ListView.builder(
                itemCount: value.items.length,
                padding: const EdgeInsets.symmetric(vertical: 16),
                itemBuilder: (context, index) =>
                    TowatchItemTile(value.items[index]),
              )
            : const Center(
                child: Text('No films added.'),
              ),
      ),
    );
  }
}


class TowatchItemTile extends StatelessWidget {
  final Media media;

  const TowatchItemTile(this.media, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: Container(
          width: 50, 
          height: 50, 
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(media.imageUrl), 
              fit: BoxFit.cover, 
            ),
          ),
        ),
        title: Text(
          media.title,
          key: Key('towatch_text_${media.id}'),
          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            fontFamily: "PlayfairDisplay",
                            color: Colors.black,
                        ),
        ),
        subtitle: Text(
          media.description,
          key: Key('towatch_description_${media.id}'),
          style: TextStyle(
                            fontSize: 12,
                            fontFamily: "PlayfairDisplay",
                        ),
        ),
        trailing: IconButton(
          key: Key('remove_icon_${media.id}'),
          icon: const Icon(Icons.close),
          onPressed: () {
            context.read<Towatch>().remove(media);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Removed from towatch.'),
                duration: Duration(seconds: 1),
              ),
            );
          },
        ),
      ),
    );
  }
}
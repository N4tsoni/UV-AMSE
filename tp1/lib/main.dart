import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tp1/ClassMedia/Media.dart';
import 'package:tp1/Fonctionnalitées/Favories.dart';
import 'package:tp1/Fonctionnalit%C3%A9es/towatch.dart';
import 'package:tp1/Pages/bd.dart';
import 'package:tp1/Pages/docu.dart';
import 'package:tp1/Pages/Favories.dart';
import 'package:tp1/Pages/film.dart';
import 'package:tp1/Pages/Home.dart';
import 'package:tp1/Pages/towatch.dart';
import 'package:tp1/Pages/Series.dart';


void main() {
  runApp(const TestingApp());
}

GoRouter router() {
  return GoRouter(
    routes: [
      GoRoute(
        path: HomePage.routeName,
        builder: (context, state) => const HomePage(),
        routes: [
          GoRoute(
            path: FilmPage.routeName,
            builder: (context, state) => const FilmPage(),
          ),
          GoRoute(
            path: SeriesPage.routeName,
            builder: (context, state) => const SeriesPage(),
          ),
          GoRoute(
            path: DocuPage.routeName,
            builder: (context, state) => const DocuPage(),
          ),
          GoRoute(
            path: BdPage.routeName,
            builder: (context, state) => const BdPage(),
          ),
          GoRoute(
            path: FavoriesPage.routeName,
            builder: (context, state) => const FavoriesPage(),
          ),
          GoRoute(
            path: TowatchPage.routeName,
            builder: (context, state) => const TowatchPage(),
          ),
        ],
      ),
    ],
  );
}


class TestingApp extends StatelessWidget {
  const TestingApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Favories>(
          create: (context) => Favories(),
        ),
        ChangeNotifierProvider<Towatch>(
          create: (context) => Towatch(),
        ),
      ],
      child: MaterialApp.router(
        title: 'TP 1 ',
        theme: ThemeData(
          colorSchemeSeed: Colors.white,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          useMaterial3: true,
        ),
        routerConfig: router(),
      ),
    );
  }
}
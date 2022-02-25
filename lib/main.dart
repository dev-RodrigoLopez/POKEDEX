import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:practica_triplei_listado_pokemones/pages/details_pokemon_page.dart';
import 'package:practica_triplei_listado_pokemones/pages/home_page.dart';

import 'package:practica_triplei_listado_pokemones/providers/pokemon_providers.dart';

void main()async{
  runApp(AppState());
} 
  

class AppState extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider( create: ( _ ) => PokemonProvider() ),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Practica TripleI',
      debugShowCheckedModeBanner: false,
      // scaffoldMessengerKey: NotificacionsService.messengerKey,
      initialRoute: 'home',
      routes: {
        'home' : ( BuildContext context ) => HomePage(),
        'details': ( BuildContext context ) => DetailsPokemonPage(),
      },
    );
  }
}
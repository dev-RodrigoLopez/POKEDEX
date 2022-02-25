import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:practica_triplei_listado_pokemones/model/pokemon_model.dart';
import 'package:practica_triplei_listado_pokemones/model/pokemon_model_quictype.dart';

class PokemonProvider with ChangeNotifier{

  List<Pokemon> lpokemonesQuictype = [];
  // List<PokemonModel> lpokemones = [];
  int pokemonLastItem = 0;
  bool isLoading = false;
  bool subirScroll = false;

  // late PokemonModel _pokemon;
  late Pokemon _pokemonQuictype;

  // PokemonModel get pokemon => _pokemon;
  // set pokemon( PokemonModel value ){
  //   _pokemon = value;
  //   notifyListeners();
  // } 

  Pokemon get pokemonQuictype => _pokemonQuictype;
  set pokemonQuictype( Pokemon value ){
    _pokemonQuictype = value;
    notifyListeners();
  } 

  Future<void> getPokemones() async{

    int pokemones = 10;
    pokemonLastItem = pokemones;
    for( int i = 1; i <= pokemones; i++ ){

      try{

        Uri url = Uri.parse( 'https://pokeapi.co/api/v2/pokemon/$i' );
        final resp = await http.get( url );
        final respData = json.decode( resp.body );
        final lPokemonesResponse = Pokemon.fromMap( respData );

        lpokemonesQuictype.add( lPokemonesResponse );
        // lpokemones.add( PokemonModel.fromJson(respData) );
        notifyListeners();

      }catch(error){
        print( error );
      }


    }

  }

  Future<void> getMorePokemones() async{
    
    subirScroll = false;
    if( lpokemonesQuictype.length > 150 ) return;

    if( isLoading ) return;


    // List<PokemonModel> tempPokemon = [];
    List<Pokemon> tempPokemon = [];
    isLoading = true;
    int pokemonInitItem = pokemonLastItem + 1 ;
    pokemonLastItem = pokemonLastItem + 10;
    notifyListeners();

    for( int i = pokemonInitItem; i < pokemonLastItem + 1; i++ ){
      try{
        Uri url = Uri.parse( 'https://pokeapi.co/api/v2/pokemon/$i' );
        final resp = await http.get( url );
        final respData = json.decode( resp.body );

        // tempPokemon.add( PokemonModel.fromJson(respData) );
        final lPokemonesResponse = Pokemon.fromMap( respData );
        tempPokemon.add( lPokemonesResponse );

      }catch(error){
        print( error );
        subirScroll = true;
        isLoading = false;
      }

    }

    lpokemonesQuictype.addAll(tempPokemon);
    subirScroll = true;
    isLoading = false;
    notifyListeners();

  }

  Future<dynamic> searchPokemon (String idNombre) async{

    try{

      Uri url = Uri.parse( 'https://pokeapi.co/api/v2/pokemon/$idNombre' );
      final resp = await http.get( url );

      final respData = json.decode( resp.body );
      final lPokemonesResponse = Pokemon.fromMap( respData );
      return lPokemonesResponse;

    }catch(error){
      print( error );
    }

  }
  


}
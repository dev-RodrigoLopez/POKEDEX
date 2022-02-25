import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:practica_triplei_listado_pokemones/providers/pokemon_providers.dart';
import 'package:practica_triplei_listado_pokemones/widgets/card_pokemon.dart';

class PokemonSearchDelegate extends SearchDelegate{

  @override
    String get searchFieldLabel => 'Buscar pokemon ';

  @override
  List<Widget> buildActions(BuildContext context) {
    return[
      IconButton(
        icon: Icon( Icons.clear), 
        onPressed: (){
          query = '';
        })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon( Icons.arrow_back ), 
      onPressed: (){
        close(context, null);
      }
    );
  }

  @override
  Widget buildResults(BuildContext context) {

    print( 'aqui' );

    if ( query.isEmpty ){

      return emptyPokemon();
    }

    return PokemonCard( context );

  }

  Widget emptyPokemon(){
    return Container(
      child: Center(
        child: Icon( Icons.catching_pokemon, color: Colors.black38, size: 200, ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    
    if( query.isEmpty ){
      return emptyPokemon();
    }

    return PokemonCard( context );
    
  }

  Widget PokemonCard( BuildContext context ){
    final pokemonProvider = Provider.of<PokemonProvider>( context, listen: false );

    return FutureBuilder(
      future: pokemonProvider.searchPokemon( query.toLowerCase() ),
      builder: ( _, AsyncSnapshot snapshot){

        if( !snapshot.hasData ) return  emptyPokemon();

        final pokemon = snapshot.data!;

        return GestureDetector(
          onTap: (){
            pokemonProvider.pokemonQuictype = pokemon;
            Navigator.pushNamed(context, 'details');
          },
          child: card_pokemon( pokemon: pokemon )
        );


      },
    );
  }

  
}



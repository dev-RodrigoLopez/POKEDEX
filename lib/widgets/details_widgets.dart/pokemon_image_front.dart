import 'package:flutter/material.dart';

class PokemonImageFront extends StatelessWidget {
  const PokemonImageFront({
    Key? key,
    required this.urlImagepokemon,
    required this.idPokemon,
  }) : super(key: key);

  final int idPokemon;
  final String urlImagepokemon;

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of( context ).size;

    return Positioned(
      bottom: size.height * 0.55,
      left: size.width * 0.5 - size.width * 0.25,
      child: Container(
        width: size.width * 0.5,
        height: size.width * 0.5,
        // color: Colors.red,
        child: Hero(
          tag: idPokemon,
          child: ClipRRect(
            // borderRadius: BorderRadius.circular(100),
            child: FadeInImage.assetNetwork(placeholder: 'assets/loading_pokemon.gif', image: urlImagepokemon , fit: BoxFit.fill,),
          ),
        ),
      ),
    );
  }
}
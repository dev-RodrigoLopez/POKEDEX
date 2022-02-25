import 'package:flutter/material.dart';

class PokemonIconFondo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of( context ).size;

    return Positioned(
      bottom: size.height * 0.55,
      left: size.width * 0.2,
      child: Container(
        width: size.width * 0.5,
        height: size.width * 0.5,
        // color: Colors.red,
        child: Icon( Icons.catching_pokemon, size: size.width * 0.60, color: Colors.white54, )
      ),
    );
  }
}
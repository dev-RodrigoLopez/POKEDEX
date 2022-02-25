import 'package:flutter/material.dart';
import 'package:practica_triplei_listado_pokemones/widgets/shimmer_widget.dart';

class CardPokemonLoading extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of( context ).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.15,
      // color: Colors.red,
      margin: EdgeInsets.symmetric( horizontal: size.width * .044 ),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: ShimmerWidget(  
              width: size.width * .9,
              heigth: size.height * 0.12,
              left: 0,
              bottom: 0,
            )
          ),
          Container(
            height: size.width * 0.3,
            width: size.width * 0.3,
            decoration: BoxDecoration(
              // color: Colors.black,
              borderRadius: BorderRadius.circular(100)
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset('assets/loading_pokemon.gif', fit: BoxFit.fill) 
            ),
           
          ),
        ],
      ),
    );
  }
  
}
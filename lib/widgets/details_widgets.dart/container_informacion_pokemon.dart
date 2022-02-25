import 'package:flutter/material.dart';

import 'package:practica_triplei_listado_pokemones/model/pokemon_model_quictype.dart';
import 'package:practica_triplei_listado_pokemones/widgets/details_widgets.dart/row_atack.dart';

class ContainerInformacionPokemon extends StatelessWidget {
  const ContainerInformacionPokemon({
    Key? key,
    required this.colorFondo,
    required this.pokemon,
  }) : super(key: key);

  final Color colorFondo;
  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of( context ).size;

    return Container(
      width: size.width * 1,
      height: size.height * 0.6,
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: const BorderRadius.only( topLeft: Radius.circular(50), topRight: Radius.circular(50) ),
      ),
      child: Column(

        children: [

          SizedBox( height: size.height * 0.07 ),

          Container(
            width: size.width * 1,
            height: size.height * 0.07,
            // color: Colors.red,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                Container( 
                  width: size.width * 0.25,
                  height: size.height * 0.05,
                  decoration: BoxDecoration(
                    color: colorFondo,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: const Center(
                    child: Text( 'Info', style: TextStyle( color: Colors.white, fontSize: 17, fontWeight: FontWeight.w500 ) ),
                  ),
                ),

                Container( 
                  width: size.width * 0.25,
                  height: size.height * 0.05,
                  decoration: BoxDecoration(
                    // color: colorFondo,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: const Center(
                    child: Text( 'Evolution', style: TextStyle( color: Colors.white, fontSize: 17, fontWeight: FontWeight.w500 ) ),
                  ),
                ),

                 Container(
                    width: size.width * 0.25,
                    height: size.height * 0.05,
                    decoration: BoxDecoration(
                      // color: colorFondo,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: const Center(
                      child: Text( 'Moves', style: TextStyle( color: Colors.white, fontSize: 17, fontWeight: FontWeight.w500 ) ),
                    ),
                 )

              ]
            ),
          ),


          Container(
            width: size.width * 1,
            height: size.height * 0.45,
            // color: Colors.red,
            padding: const EdgeInsets.symmetric( horizontal: 20, vertical: 20 ),
            child: Column(
              children: [
                
                const Text(
                  'Esta es una breve descripcion del pokemon, que hace, que poderes, que tamaño tiene, que color es, donde es su habitad, de que se alimenta, y cuales son sus poderes mas comunes',
                  style: TextStyle( fontSize: 16, color: Colors.white ),
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.justify,
                ),

                Container(
                  margin: EdgeInsets.only( top: 30 ),
                  width: size.width * 1,
                  height: size.height * 0.25,
                  // color: Colors.amber,
                  child: Column(
                    children: [
                      RowAtack( ataque: 'HP  ', poder: pokemon.stats[0].baseStat.toString() ),
                      RowAtack( ataque: 'ATK ', poder: pokemon.stats[1].baseStat.toString()  ),
                      RowAtack( ataque: 'DEF ', poder: pokemon.stats[2].baseStat.toString()  ),
                      RowAtack( ataque: 'SATK', poder: pokemon.stats[3].baseStat.toString()  ),
                      RowAtack( ataque: 'SDEF', poder: pokemon.stats[4].baseStat.toString()  ),
                      RowAtack( ataque: 'SPD ', poder: pokemon.stats[5].baseStat.toString()  ),
                    ],
                  ),
                )



              ]
            ),
          )


        ],
      ),
    );
  }
}
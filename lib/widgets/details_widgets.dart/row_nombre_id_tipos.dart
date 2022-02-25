import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:practica_triplei_listado_pokemones/helpers/colores_map_helper.dart';
import 'package:practica_triplei_listado_pokemones/helpers/icon_tipo_map_helper.dart';

import 'package:practica_triplei_listado_pokemones/model/pokemon_model_quictype.dart';

class RowNombreIDTipos extends StatelessWidget {
  const RowNombreIDTipos({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of( context ).size;

    return Row(
      children: [
        Container(
          margin: EdgeInsets.all( size.width * 0.05 ),
          width: size.width * 0.9,
          // color: Colors.black,
          child: Row(
            children: [

              Container(
                width: size.width * 0.7,
                height: size.height * 0.1,
                // color: Colors.red,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    Text( toBeginningOfSentenceCase( pokemon.name )!, style: const TextStyle( fontWeight: FontWeight.w700, fontSize: 30, color: Colors.white )),
                   
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric( horizontal: 10 ),
                          height: size.height * 0.04,
                          width: size.width * 0.25,
                          decoration: BoxDecoration( 
                            color: CategoriaTipoColor( pokemon.types[0].type.name ),
                            borderRadius: BorderRadius.circular(20)
                           ),
                           child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                             children: [

                              //  ( pokemon.type2 == null )
                              Text(
                                TipoPokemonIcon( pokemon.types[0].type.name ),
                                style: const TextStyle(
                                  fontFamily: 'PokemonIconTypes',
                                  color: Colors.white,
                                  fontSize: 20
                                ),
                              ),
                              Text( 
                                toBeginningOfSentenceCase( pokemon.types[0].type.name )!,
                                style: TextStyle( color: Colors.white ) 
                              )

                             ],

                           ),
                        ),

                        SizedBox( width: 5),

                        ( pokemon.types.length > 1 )
                        ? Container(
                            padding: const EdgeInsets.symmetric( horizontal: 10 ),
                            height: size.height * 0.04,
                            width: size.width * 0.25,
                            decoration: BoxDecoration( 
                              color: CategoriaTipoColor( pokemon.types[1].type.name ),
                              borderRadius: BorderRadius.circular(20)
                            ),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [

                                //  ( pokemon.type2 == null )
                                ( pokemon.types.length > 1 )
                                ?  Text(
                                    TipoPokemonIcon( pokemon.types[1].type.name ),
                                    style: const TextStyle(
                                      fontFamily: 'PokemonIconTypes',
                                      color: Colors.white,
                                      fontSize: 20
                                    ),
                                  )
                                :  const Icon( Icons.catching_pokemon_rounded, size: 20, color: Colors.white, ),
                                Text( 
                                    toBeginningOfSentenceCase( pokemon.types[1].type.name )!,
                                    style: TextStyle( color: Colors.white ) 
                                  )

                              ],
                            ),
                          )
                        : Container()

                      ],
                    )


                  ],
                ),
              ),

              Expanded(
                child: Container(
                  alignment: Alignment.centerRight,
                  child: Text( '#${pokemon.id}', style: const TextStyle( fontSize: 25, fontWeight: FontWeight.w500, color: Colors.white ), ),
                )
              )

            ],
          ),
        )
      ],
    );
  }
}
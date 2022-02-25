import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:practica_triplei_listado_pokemones/helpers/colores_map_helper.dart';
import 'package:practica_triplei_listado_pokemones/helpers/icon_tipo_map_helper.dart';
import 'package:practica_triplei_listado_pokemones/model/pokemon_model.dart';
import 'package:practica_triplei_listado_pokemones/model/pokemon_model_quictype.dart';

class card_pokemon extends StatelessWidget {

  // PokemonModel pokemon;
  Pokemon pokemon;

  card_pokemon({Key? key, required this.pokemon }) : super(key: key);
  

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of( context ).size;
    double sizeG = size.height * 0.16;

    return Container(
      width: double.infinity,
      height: size.height * 0.16,
      // color: Colors.red,
      margin: EdgeInsets.symmetric( horizontal: size.width * .044 ),
      child: Stack(
        children: [
         
          Positioned(
            bottom: 0,
            child: Container(
              width: size.width * .9,
              height: size.height * 0.13,
              decoration: BoxDecoration(
                // color: ItemBackgroundColor(pokemon.type1.toString()),
                color: ItemBackgroundColor(pokemon.types[0].type.name.toString()),
                borderRadius: BorderRadius.circular(20)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox( width: size.width * 0.32 ),
                  Container(
                    width: size.width * 0.5,
                    height: size.height * 0.1,

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text(
                          '# ${pokemon.id}',
                          style: TextStyle(
                            fontSize: ( size.height * 0.16 >  110) ? 15 : 12,
                            fontWeight: FontWeight.w700
                          ),
                        ),

                        Text(
                          toBeginningOfSentenceCase( pokemon.name )!,
                          style: TextStyle(
                            fontSize: ( size.height * 0.16 >  110) ? 25 : 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.white
                          ),
                        ),

                        Row(
                          children: [

                            IconTipo( tipopokemon: pokemon.types[0].type.name ),
                            SizedBox( width: 5 ),
                            if( pokemon.types.length > 1 )
                              IconTipo( tipopokemon: pokemon.types[1].type.name)
                            else
                              Container()

                            

                          ],
                        )

                      ],
                    ),
                  )
                ],
              ),
            ),
          ),

          Container(
            height: size.width * 0.3,
            width: size.width * 0.3,
            decoration: BoxDecoration(
              // color: Colors.black,
              borderRadius: BorderRadius.circular(100)
            ),
            child: Hero(
              tag: pokemon.id,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: FadeInImage.assetNetwork(placeholder: 'assets/loading_pokemon.gif', image:  pokemon.sprites.other!.home.frontDefault , fit: BoxFit.fill,),
                  // child: FadeInImage.assetNetwork(placeholder: 'assets/loading_pokemon.gif', image:  pokemon.sprites.frontDefault , fit: BoxFit.fill,),
              ),
            ),
           
          ),

          Positioned(
            bottom: 0,
            right: 0,
            child: Icon( Icons.catching_pokemon, color: Colors.white24, size: size.width * 0.25 ),
          ),

        ],
      ),
    );
  }
  
}

class IconTipo extends StatelessWidget {
  IconTipo({
    Key? key,
    required this.tipopokemon,
  }) : super(key: key);

  String tipopokemon;

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of( context ).size;

    return Container(
      width: size.width * 0.07,
      height: size.width * 0.07,
      decoration: BoxDecoration(
        color: CategoriaTipoColor( tipopokemon ),
        borderRadius: BorderRadius.circular(100)
      ),
      child: 
        Center(
          child: 
            Text(
              TipoPokemonIcon( tipopokemon ),
              style: const TextStyle(
                fontFamily: 'PokemonIconTypes',
                color: Colors.white,
              ),
            )
        )
    );
  }
}
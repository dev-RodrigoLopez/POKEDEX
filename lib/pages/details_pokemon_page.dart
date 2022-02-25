import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:practica_triplei_listado_pokemones/widgets/details_widgets.dart/container_informacion_pokemon.dart';
import 'package:practica_triplei_listado_pokemones/widgets/details_widgets.dart/pokemon_icon_fondo.dart';
import 'package:practica_triplei_listado_pokemones/widgets/details_widgets.dart/pokemon_image_front.dart';
import 'package:practica_triplei_listado_pokemones/widgets/details_widgets.dart/row_nombre_id_tipos.dart';

import 'package:practica_triplei_listado_pokemones/helpers/colores_map_helper.dart';
import 'package:practica_triplei_listado_pokemones/providers/pokemon_providers.dart';
import 'package:practica_triplei_listado_pokemones/widgets/appbar_widget.dart';

class DetailsPokemonPage extends StatelessWidget {
  const DetailsPokemonPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of( context ).size;
    // final pokemon = Provider.of<PokemonProvider>(context).pokemon;
    final pokemon = Provider.of<PokemonProvider>(context).pokemonQuictype;

    Color colorFondo = ItemBackgroundColor(pokemon.types[0].type.name.toString());


    return Scaffold(
      body: Container(
        color: colorFondo,
        child: Stack(
          children: [

            PokemonIconFondo(),

            Column(
              children: [
                AppBarWidget(),                

                RowNombreIDTipos( pokemon: pokemon),

                const Spacer(),

                ContainerInformacionPokemon(colorFondo: colorFondo, pokemon: pokemon)
              ],
            ),


            PokemonImageFront(urlImagepokemon: pokemon.sprites.other!.home.frontDefault, idPokemon: pokemon.id,)


          ],
        ),
      )
    );
  }
}









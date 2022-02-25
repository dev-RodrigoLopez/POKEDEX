import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:practica_triplei_listado_pokemones/pages/search_delagate_page.dart';

import 'package:practica_triplei_listado_pokemones/providers/pokemon_providers.dart';

import 'package:practica_triplei_listado_pokemones/widgets/card_pokemon.dart';
import 'package:practica_triplei_listado_pokemones/widgets/card_pokemon_loading.dart';

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {

  final ScrollController scrollController = ScrollController();

  
  @override
  void initState() {
    super.initState();
    Provider.of<PokemonProvider>(context, listen: false).getPokemones();
    scrollController.addListener(() { 
      if( (scrollController.position.pixels + 100) >= scrollController.position.maxScrollExtent ){
        Provider.of<PokemonProvider>(context, listen: false).getMorePokemones();
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    scrollController.dispose();
  }

  
  @override
  Widget build(BuildContext context) {

    // final lpokemones = Provider.of<PokemonProvider>(context).lpokemones;
    final lpokemones = Provider.of<PokemonProvider>(context).lpokemonesQuictype;
    bool isLoading = Provider.of<PokemonProvider>(context).isLoading;
    bool subirScroll = Provider.of<PokemonProvider>(context).subirScroll;
    final pokemonProvider = Provider.of<PokemonProvider>(context);
    final size = MediaQuery.of( context ).size;
        
    if( subirScroll && lpokemones.length >= 9 ){
      if( scrollController.position.pixels + 100 <= scrollController.position.maxScrollExtent ){}
      else{
        scrollController.animateTo(
          scrollController.position.pixels + 100, 
          duration: const Duration( milliseconds: 300 ), 
          curve: Curves.fastOutSlowIn
        );

      }
    }


    return Scaffold(
      backgroundColor: Colors.grey[800],
     
      body: Container(
        width: double.infinity,
        height: double.infinity,
        // margin: const EdgeInsets.all(10),
        child: Stack(
          children: [
            Column(
              children: [

                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10  ),
                  width: size.width * 1,
                  height: size.height * 0.25,
                  // color: Colors.red,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox( height: size.height * 0.05),
                      const Text( 'Pokédex', style: TextStyle( fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white  ), ),
                      const Text( 
                        'Busca un pokemon por su nombre o por el Id Pokemon', 
                        style: 
                          TextStyle( 
                            fontSize: 18,
                            color: Colors.white  
                          ), 
                        maxLines: 2,
                      ),

                      SizedBox( height: size.height * 0.015 ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () => showSearch( context: context, delegate: PokemonSearchDelegate()),
                            child: Container(
                              width: size.width * 0.8,
                              height: size.height * 0.05,
                              decoration: BoxDecoration( 
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(10)
                               ),
                               child: Row(
                                 children: const [
                                   SizedBox( width: 5 ),
                                   Icon( Icons.search , color: Colors.white),
                                   SizedBox( width: 5 ),
                                   Text( 'Nombre o Identificador', style: TextStyle( color: Colors.white, fontSize: 18 ))
                                 ],
                               ),
                            ),
                          ),

                          GestureDetector(
                            onTap: () => showSearch( context: context, delegate: PokemonSearchDelegate()),
                            child: Container(
                              width: size.width * 0.12,
                              height: size.height * 0.05,
                              decoration: BoxDecoration(
                                 color: Colors.black,
                                borderRadius: BorderRadius.circular(10)
                              ),
                              child: Center(
                                child: Icon( Icons.search, color: Colors.white, size: 30, ),
                              ),
                            ),
                          )

                        ],
                      )

                    ],
                  ),
                  // color: Colors.red,
                ),

                Container(
                  width: size.width * 1,
                  height: size.height * 0.75,
                  // color: Colors.blue,
                  child: ListView.builder(
                    controller: scrollController,
                    physics: const BouncingScrollPhysics(),
                    itemCount: ( lpokemones.length >= 9 ) ? lpokemones.length : 9,
                    itemBuilder: ( context, index ){
                      return ( lpokemones.length >= 9 )
                        ? GestureDetector(
                            onTap: (){
                              pokemonProvider.pokemonQuictype = lpokemones[index];
                              Navigator.pushNamed(context, 'details');
                            },
                            child: 
                              card_pokemon( pokemon: lpokemones[index] )
                          )
                        : CardPokemonLoading();
                    }
                  ),
                ),
              ],
            ),

            if( isLoading )
              Positioned(
                bottom: 10,
                left:  size.width * 0.5 -  30,
                child: circularprogres(),
              )

          ],
        ),
      ),
    );
  }

  Container circularprogres() {
    return Container( 
              padding: EdgeInsets.all(10),
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.5),
                borderRadius: BorderRadius.circular(100)
              ),
              child: const CircularProgressIndicator(),
             );
  }
}




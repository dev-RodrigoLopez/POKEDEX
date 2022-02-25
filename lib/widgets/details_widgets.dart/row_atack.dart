import 'package:flutter/material.dart';


class RowAtack extends StatelessWidget {
  RowAtack({
    Key? key,
    required this.ataque,
    required this.poder
  }) : super(key: key);

  String ataque;
  String poder;

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of( context ).size;
    final sizeBarraGeneral = size.width * 0.6;
    final double porcentaje = sizeBarraGeneral / 100;
    double poderReal = double.parse( poder );
    if( poderReal > 100 ){
      poderReal = 100;
    }
    final porcentajeBarra = poderReal * porcentaje;

    return Container(
      margin: EdgeInsets.only(top: 8 ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [ 
          Text( 
            ataque, 
            style: const TextStyle( color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16 ),
            ),
           Text( 
            poder, 
            style: const TextStyle( color: Colors.white,  fontSize: 16 ),
            ),
            Stack(
              children: [

                Container( 
                  height: 10,
                  width: sizeBarraGeneral,
                  decoration: BoxDecoration(
                    color: Colors.black,  
                    borderRadius: BorderRadius.circular(20)
                  ),
                ),
                Container( 
                  height: 10,
                  width: porcentajeBarra,
                  decoration: BoxDecoration(
                    color: Colors.green,  
                    borderRadius: BorderRadius.circular(20)
                  ),
                )

              ],
            )
          
         ],
      ),
    );
  }
}
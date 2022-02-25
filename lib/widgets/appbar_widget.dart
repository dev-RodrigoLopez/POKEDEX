import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of( context ).size;

    return Padding(
      padding: EdgeInsets.only( top: size.width * 0.08 ),
      child: Row(
        children: [

          IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: const Icon( Icons.arrow_back_ios_new, color: Colors.white, )
          ),

          Expanded(child: Container()),

          IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: const Icon( Icons.search, color: Colors.white, )
          ),

          IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: const Icon( Icons.favorite, color: Colors.white, )
          ),

        ],
      ),
    );
  }
}
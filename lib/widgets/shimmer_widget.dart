import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {

  double heigth;
  double width;
  double left;
  double bottom;

  ShimmerWidget({Key? key, required this.heigth, required this.width, required this.left, required this.bottom }) : super(key: key);

  @override
  Widget build(BuildContext context) {
  final size = MediaQuery.of(context).size;
    return Shimmer.fromColors(
      loop: 10,
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.white,
      child: Container(
        margin: EdgeInsets.only( left: left, bottom: bottom ),
        height: heigth,
        width: width,
         decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular( 10 ),
        ),
      ),
    );
  }
}
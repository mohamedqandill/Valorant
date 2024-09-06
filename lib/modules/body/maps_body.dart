import 'package:flutter/material.dart';
import 'package:valorant/models/MapsModel.dart';

class MapsBody extends StatelessWidget {
  MapsBody({required this.data, super.key});
  DataMaps data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(

        children: [



          ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(


                data.splash ?? "",
                fit: BoxFit.cover,
                height: 200,
                width: 400,
              )),


          Positioned(
              right: 0,
              child: Image.network(
                data.displayIcon ?? "",
                height: 200,
                width: 200,
              )),

          Positioned(
              left: 20,
              top: 12,
              child: Text(
                data.displayName ?? "",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    color: Colors.white),
              )),

        ],
      ),
    );
  }
}

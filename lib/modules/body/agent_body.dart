import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:valorant/models/AgentModel.dart';

class AgentBody extends StatelessWidget {
  AgentBody({required this.data, super.key});
  DataAgent data;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
         children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
            height: 430,
            width: 280,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: hexToColorList(data.backgroundGradientColors ?? []),
                ),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(71),
                    topRight: Radius.circular(24),
                    bottomLeft: Radius.zero,
                    bottomRight: Radius.circular(80))),
          ),
          Positioned(
              bottom: 15,
              left: -80,
              child: SizedBox(
                  width: 450,
                  height: 650,
                  child: Image.network(
                    data.fullPortraitV2 ?? '',
                  ))),
          Positioned(
              bottom: 40,
              left: 30,
              child: Text(
                data.displayName ?? '',
                style: const TextStyle(color: Colors.white, fontSize: 36),
              ))
        ]),
      ],
    );
  }

  List<Color> hexToColorList(List<String> hexStrings) {
    return hexStrings.map((hexString) {
      return Color(int.parse(hexString, radix: 16));
    }).toList();
  }
}

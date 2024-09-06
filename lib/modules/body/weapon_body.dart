import 'package:flutter/material.dart';
import 'package:valorant/models/WeaponModel.dart';

class WeaponBody extends StatelessWidget {
  WeaponBody({required this.data, required this.isEven, super.key});
  DataWeapons data;
  bool isEven;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 400,
          height: 130,
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Color(0xff081E34),

            borderRadius: BorderRadius.circular(20)

          ),
        ),
        Positioned(
          // bottom: 0,
            bottom: 0,
            right: 0,
            child: Transform.rotate(
              angle: 0.8,
              child: Image.network(
                data.displayIcon ?? "",
                height: 60,
              ),
            )),

        Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Positioned(
                left: 20,
                child: Text(
                  data.displayName ?? "",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                      color: Colors.white),
                ),
              ),
              Text(
                  "${data.category?.substring(21, 26) == "Heavy" ? "Weapons" : "Assualt"} ${data.category?.substring(21, 26) ?? ""}",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.white))
            ],
          ),
        )
      ],
    );
  }
}

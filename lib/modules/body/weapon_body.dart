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
            bottom: 20,
            right: isEven?0:100,
            left: !isEven?0:100,
            child: Transform.flip(
              flipX: !isEven?true:false,
              child: Transform.rotate(
                angle: 0.5,
                child: Image.network(
                  data.displayIcon ?? "",
                  height: 60,
                ),
              ),
            )),

        Padding(
          padding: const EdgeInsets.all(25.0),
          child: Container(
            margin: EdgeInsets.only(left:!isEven? 230:0),
            child: Column(
               // crossAxisAlignment: CrossAxisAlignment.end
              children: [
                Positioned(
                  // left: isEven?20:130,
                  right: 30,
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
          ),
        )
      ],
    );
  }
}

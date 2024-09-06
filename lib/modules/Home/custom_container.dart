import 'package:flutter/material.dart';

class Custom_Container extends StatelessWidget {
   Custom_Container({required this.selectedTap,required this.text,super.key});
  int selectedTap;
  String text;

  @override
  Widget build(BuildContext context) {
    return  Container(
      alignment: Alignment.center,
      width: 150,
      height: 45,
      decoration: BoxDecoration(
          color: selectedTap==selectedTap?Color(0xffFD4556):Colors.transparent,
          borderRadius: BorderRadius.circular(15)),
      child: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
      ),
    );
  }
}

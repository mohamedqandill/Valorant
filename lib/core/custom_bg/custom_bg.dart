import 'package:flutter/material.dart';

class Custom_BG extends StatelessWidget {
   Custom_BG({required this.widget,super.key});
  Widget widget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff06111C),

      appBar: AppBar(
        toolbarHeight: 150,
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Column(

          children: [
            SizedBox(height: 20,),
            Image.asset("assets/Logo Icon.png"),
            SizedBox(height: 5,),
            Image.asset("assets/Logo Text.png")
          ],
        ),
      ),
      body:widget ,


    );
  }
}

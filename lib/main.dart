import 'package:flutter/material.dart';
import 'package:valorant/modules/Charachter/charachter_details.dart';
import 'package:valorant/modules/Home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Flutter Demo',

      // home: HomeScreen()
        routes: {
      HomeScreen.routeName:(_)=>HomeScreen(),
      CharacterDetails.routeName:(_)=>CharacterDetails(),
    },
      initialRoute: HomeScreen.routeName,
    );
  }
}

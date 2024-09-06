import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:valorant/core/custom_bg/custom_bg.dart';
import 'package:valorant/models/AgentModel.dart';

class CharacterDetails extends StatefulWidget {
  static const String routeName = "char";

  const CharacterDetails({super.key});

  @override
  State<CharacterDetails> createState() => _CharacterDetailsState();
}

class _CharacterDetailsState extends State<CharacterDetails> {
  @override
  Widget build(BuildContext context) {
    DataAgent data = ModalRoute.of(context)!.settings.arguments as DataAgent;
    return Container(
      decoration: BoxDecoration(color: Color(0xff06111C)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
                setState(() {});
              },
              child: Icon(Icons.arrow_back)),
          centerTitle: true,
          title: Text(data.displayName ?? "",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
          actions: [Image.asset("assets/displayicon 1.png")],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                Image.network(
                  data.background ?? "",
                  height: 500,
                  width: 500,
                ),
                SizedBox(
                    height: 500,
                    width: 600,
                    child: Image.network(
                      data.fullPortrait ?? "",
                      fit: BoxFit.cover,
                    )),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Text(
                "DESCREPTION",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.white),
              ),
            ),
            // SizedBox(height: 1,),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Text(
                data.description ?? "",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Text(
                "ABILITES",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.white),
              ),
            ),
            SizedBox(height: 10,),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return
                  SizedBox(width: 40);
                },
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                return Container(
                  width: 70,
                  height: 40,
                  padding: EdgeInsets.all(5),

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 1,color: Colors.white),
                    color: Colors.transparent,

                  ),
                  child: Image.network(data.abilities?[index].displayIcon??""),
                );
              },),
            )
          ],
        ),
      ),
    );
  }
}


import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:valorant/core/custom_bg/custom_bg.dart';
import 'package:valorant/models/AgentModel.dart';
import 'package:valorant/models/MapsModel.dart';
import 'package:valorant/models/WeaponModel.dart';
import 'package:valorant/modules/Charachter/charachter_details.dart';
import 'package:valorant/modules/body/agent_body.dart';
import 'package:valorant/modules/body/maps_body.dart';
import 'package:valorant/modules/body/weapon_body.dart';
import 'package:valorant/services/Apis/api_manager.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName="home";
   HomeScreen({super.key});


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedTap=0;



  @override
  Widget build(BuildContext context) {

    return Custom_BG(
        widget: Column(
      children: [
        SizedBox(
          height: 50,
        ),
        DefaultTabController(
            length: 3,
            child: TabBar(
              onTap: (value){
                selectedTap=value;
                setState(() {

                });

              },
              dividerColor: Colors.transparent,
              indicatorColor: Colors.transparent,

              unselectedLabelStyle: TextStyle(color: Colors.white),
              tabs: [
                Container(
                  alignment: Alignment.center,
                  width: 150,
                  height: 45,
                  decoration: BoxDecoration(
                      color: selectedTap==0?Color(0xffFD4556):Colors.transparent,
                      borderRadius: BorderRadius.circular(15)),
                  child: Image.asset("assets/Agents.png")
                ),
                Container(
                  alignment: Alignment.center,
                  width: 150,
                  height: 45,
                  decoration: BoxDecoration(
                      color:  selectedTap==1?Color(0xffFD4556):Colors.transparent,
                      borderRadius: BorderRadius.circular(15)),
                  child: Image.asset("assets/Maps.png")
                ),
                Container(
                  alignment: Alignment.center,
                  width: 150,
                  height: 45,
                  decoration: BoxDecoration(
                      color:  selectedTap==2?Color(0xffFD4556):Colors.transparent,
                      borderRadius: BorderRadius.circular(15)),
                  child:  Image.asset("assets/Weapons.png")
                ),

              ],
            )
        ),
        SizedBox(height: 60,),
        selectedTap==0?FutureBuilder(
            future: ApiManager.getAgents(),
            builder: (context, snapshot) {
              if(snapshot.connectionState==ConnectionState.waiting){
                return Center(child: CircularProgressIndicator(),);
              }
              else if(snapshot.hasError){
                return Text("Error");
              }
              List<DataAgent> agents = snapshot.data ?? [];

              return CarouselSlider.builder(
                

                itemCount: 15,
                // disableGesture: true,
                itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
                    Container(
                      child: InkWell(
                          onTap: (){
                            Navigator.pushNamed(context, CharacterDetails.routeName,arguments: agents[itemIndex]);

                          },
                          child: AgentBody(data: agents[itemIndex]))
                    ), options: CarouselOptions(height: 550,animateToClosest: true),
              );
            },
            ):selectedTap==1?
        FutureBuilder(
          future: ApiManager.getMaps(),
          builder: (context, snapshot) {
            if(snapshot.connectionState==ConnectionState.waiting){
              return Center(child: CircularProgressIndicator(),);
            }
            else if(snapshot.hasError){
              return Text("Error");
            }
            List<DataMaps> Maps = snapshot.data ?? [];
            // print(agents[0].fullPortraitV2??"");
            return Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return SizedBox(height: 20,);
                },
                itemCount: Maps.length,
                itemBuilder: (context, index) {
                  return MapsBody(data: Maps[index],);
                },),
            );
          },
        )
        :FutureBuilder(
          future: ApiManager.getWeapons(),
          builder: (context, snapshot) {
            if(snapshot.connectionState==ConnectionState.waiting){
              return Center(child: CircularProgressIndicator(),);
            }
            else if(snapshot.hasError){
              return Text("Error");
            }
            List<DataWeapons> Weapon = snapshot.data ?? [];
            // print(agents[0].fullPortraitV2??"");
            return Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return SizedBox(height: 60,);
                },
                itemCount: Weapon.length,
                itemBuilder: (context, index) {
                  return WeaponBody(data: Weapon[index],isEven: index%2==0,);
                },),
            );
          },
        ),



      ],
    ));
  }


}

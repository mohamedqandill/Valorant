
import 'dart:convert';

import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:valorant/models/AgentModel.dart';
import 'package:valorant/models/MapsModel.dart';
import 'package:valorant/models/WeaponModel.dart';

class ApiManager{






  static Future<List<DataAgent>> getAgents() async {
    final dio = Dio();
    Response response = await dio.get('https://valorant-api.com/v1/agents');
    Map<String, dynamic> json = response.data;
    List<dynamic> data = json['data'];
    List<DataAgent> agents = [];

    for(var i in data) {
      agents.add(DataAgent.fromJson(i));
    }

    return agents;
    }


  static Future<List<DataMaps>> getMaps() async {
    final dio = Dio();
    Response response = await dio.get('https://valorant-api.com/v1/maps');
    Map<String, dynamic> json = response.data;
    List<dynamic> data = json['data'];
    List<DataMaps> Maps = [];

    for(var i in data) {
      Maps.add(DataMaps.fromJson(i));
    }

    return Maps;
  }




  static Future<List<DataWeapons>> getWeapons() async {
    final dio = Dio();
    Response response = await dio.get('https://valorant-api.com/v1/weapons');
    Map<String, dynamic> json = response.data;
    List<dynamic> data = json['data'];
    List<DataWeapons> Weapons = [];

    for(var i in data) {
      Weapons.add(DataWeapons.fromJson(i));
    }

    return Weapons;
  }





}
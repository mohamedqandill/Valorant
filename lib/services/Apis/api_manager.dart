
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
    List<dynamic> articlesData = json['data'];
    List<DataAgent> agents = [];

    for(var article in articlesData) {
      agents.add(DataAgent.fromJson(article));
    }

    return agents;
    }


  static Future<List<DataMaps>> getMaps() async {
    final dio = Dio();
    Response response = await dio.get('https://valorant-api.com/v1/maps');
    Map<String, dynamic> json = response.data;
    List<dynamic> articlesData = json['data'];
    List<DataMaps> agents = [];

    for(var article in articlesData) {
      agents.add(DataMaps.fromJson(article));
    }

    return agents;
  }




  static Future<List<DataWeapons>> getWeapons() async {
    final dio = Dio();
    Response response = await dio.get('https://valorant-api.com/v1/weapons');
    Map<String, dynamic> json = response.data;
    List<dynamic> articlesData = json['data'];
    List<DataWeapons> agents = [];

    for(var article in articlesData) {
      agents.add(DataWeapons.fromJson(article));
    }

    return agents;
  }





}
import 'package:fluttercovid/models/statistics.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class StatisticsHTTP{

  static const String baseUrl = 'https://coronavirus-19-api.herokuapp.com';

  Future<Statistics> findStatistics() async{
    final response = await http.get(
        baseUrl+'/all'
    );

    print('Statistics - '+response.statusCode.toString());

    if (response.statusCode == 200) {
      print("Statistics - Exito body");
      print(response.body);
      return Statistics.fromJson(json.decode(response.body));
    }

    else {
      throw Exception('Failed to search country');
    }

  }
}
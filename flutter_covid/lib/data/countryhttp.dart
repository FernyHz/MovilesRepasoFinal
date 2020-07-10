import 'package:fluttercovid/models/country.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CountryHTTP {

  static const String baseUrl = 'https://coronavirus-19-api.herokuapp.com';

  Future<List<Country>> allCountries(http.Client client) async{

    final response =
    await client.get(
        baseUrl + '/countries'
    );

    print(response.statusCode);

    if(response.statusCode == 200){
      print(response.body);
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
      List<Country> countries = parsed.map<Country>((json) => Country.fromJson(json)).toList();

      if(countries.length > 0)
        countries.removeAt(0);

      return countries;
    }

    else{
      throw Exception('Error: No se cargaron los paises');
    }
  }

  Future<Country> findCountry(String title) async {

    final response = await http.get(
        baseUrl+'/countries/'+title
    );

    print('Busqueda - '+response.statusCode.toString());

    if (response.statusCode == 200) {
      print("Busqueda - Exito body");
      print(response.body);
      return Country.fromJson(json.decode(response.body));
    }

    else {
      throw Exception('Failed to search country');
    }
  }
}
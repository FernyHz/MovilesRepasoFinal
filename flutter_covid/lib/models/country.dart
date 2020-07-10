
class Country{
  String country;
  int cases;
  int todayCases;
  int deaths;
  int todayDeaths;
  int recovered;
  int active;
  int critical;
  int casesPerOneMillion;
  int deathsPerOneMillion;
  int totalTests;
  int testsPerOneMillion;

  Country({this.country,this.cases,this.todayCases,this.deaths,this.todayDeaths,this.recovered,this.active,this.critical,this.casesPerOneMillion,this.deathsPerOneMillion,this.totalTests,this.testsPerOneMillion});

  factory Country.fromJson(Map<String, dynamic> json){
    return Country(
      country: json['country'],
      cases: json['cases'],
      todayCases: json['todayCases'],
      deaths: json['deaths'],
      todayDeaths: json['todayDeaths'],
      recovered: json['recovered'],
      active: json['active'],
      critical: json['critical'],
      casesPerOneMillion: json['casesPerOneMillion'],
      deathsPerOneMillion: json['deathsPerOneMillion'],
      totalTests: json['totalTests'],
      testsPerOneMillion: json['testsPerOneMillion'],
    );
  }
}
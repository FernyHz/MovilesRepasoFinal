class Statistics{
  int cases = 0;
  int deaths = 0;
  int recovered = 0;

  Statistics({this.cases = 0,this.deaths = 0,this.recovered = 0});

  factory Statistics.fromJson(Map<String, dynamic> json){
    return Statistics(
      cases: json['cases'],
      deaths: json['deaths'],
      recovered: json['recovered'],
    );
  }

  @override
  String toString() => 'Statistics: {cases: '+cases.toString()+', deaths: '+deaths.toString()+', recovered: '+recovered.toString()+'}';
}
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:fluttercovid/data/MoorDatabase.dart';
import 'package:fluttercovid/data/countryhttp.dart';
import 'package:fluttercovid/data/statisticshttp.dart';

import 'models/country.dart';
import 'models/statistics.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  //como es para varios objetos entonces Multiprovider
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      //Providers para simplificar la forma en que se llama a las clases
        providers: [
          Provider(create: (_) => Database()),
          Provider(create: (_) => CountryHTTP()),
          Provider(create: (_) => StatisticsHTTP())
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          home: MyHomePage(),
          debugShowCheckedModeBanner: false,
        ));

  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<Country> countries;
  Icon visibleIcon=Icon(Icons.search);
  Widget searchBar=Text('Barra de Busqueda');
  Statistics stats;
  int _selectedIndex;

  //llamando inicializacion
  @override
  void initState() {
    _selectedIndex=0;
    super.initState();
  }

  //
  @override
  void didChangeDependencies() {
    _initList(this.context);
    _initStats(this.context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: searchBar,
        actions: <Widget>[
          IconButton(
            icon: visibleIcon,
            onPressed: (){
              setState(() {
                //si se presiona la barrita de busqueda
                //se cambiara al modo de busqueda
                if(visibleIcon.icon==Icons.search){
                  visibleIcon=Icon(Icons.cancel);
                  searchBar=TextField(
                    textInputAction: TextInputAction.search,
                    style: TextStyle(
                      color:Colors.white,
                      fontSize: 20.0,
                    ),
                    //cuando se presiona enter el texto que se captura
                      // Se captura lo que se escribio
                    onSubmitted: (String text){
                      //con lo que se capturo se realiza la busqueda
                      _search(text);
                    }
                  );
                }else{
                  visibleIcon=Icon(Icons.search);
                  searchBar=Text('Barra de Busqueda');
                  //Lista todos los datos por defecto
                  _initList(context);
                }
              });
            },
          )
        ],
      ),
      body: _buildBody(context),
      bottomNavigationBar: BottomNavigationBar(
        //inicia en indice 0
        currentIndex: _selectedIndex,
        //color
        selectedItemColor: Colors.blueAccent,
        onTap: (int index){
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text('Favourite'),
          ),
        ],
      ),
    );
  }

  //inicializando lista
  Future _initList(BuildContext context) async{
    final httpCountry = Provider.of<CountryHTTP>(context);
    //vaciando lista
    countries = List();
    List<Country> temp = await httpCountry.allCountries(http.Client());
    setState(() {
      countries = temp;
    });
    print("Countries size init: "+countries.length.toString());
  }

  Future _search(String text) async{
    print("Iniciando Busqueda");
    final httpCountry = Provider.of<CountryHTTP>(this.context);
    Country searchTemp = await httpCountry.findCountry(text);
    setState(() {
      //con el list se vacea la lista
      countries= List();
      countries.add(searchTemp);
    });
  }

  Future _initStats(BuildContext context) async{
    final httpStats = Provider.of<StatisticsHTTP>(context);
    print("init stats");
    stats = Statistics();
    Statistics statsTemp = await httpStats.findStatistics();
    print("After getStats");
    setState(() {
      stats = statsTemp;
      print('setState-Statistics');
    });
  }

  Widget _buildBody(BuildContext context) {
    //para lista de favoritos que se agregaron en base de datos
    final database = Provider.of<Database>(context);

    if (_selectedIndex == 0) {
      print("Ayuda");
      return Column(
        children: [
          Container(

            margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: Row(
              children: <Widget>[
                _buildStatCard('Total Cases', stats.cases, Colors.red,context),
                _buildStatCard('Total Deaths', stats.deaths, Colors.blue,context),
                _buildStatCard(
                    'Total Recovered', stats.recovered, Colors.green,context),
              ],
            ),
          ),
          SizedBox(height: 8.0),
          Expanded(
              child: _CountryList(countries: countries, database: database)
          )
        ],
      );
    }
    else {
      //este contenedor muestra el contenido en tiempo real
      return StreamBuilder(
        //llamando a la vista de la bde en tiempo real
          stream: database.watchAllCountries,
          builder: (context, AsyncSnapshot <List<CountryDB>> snapshot) {
            //snapchot.data es la informacion que viene de lo que se agrego
            //a favoritos
            final countriesDB = snapshot.data ?? List();

            if (countriesDB.length == 0)
              return Center(
                child: Text('Sin favoritos'),
              );
            return _FavouriteList(favourites: countriesDB, database: database);
          }
      );
    }
  }




  Widget _buildStatCard(String title,int number,Color color,BuildContext context){

    return Container(
      //altura y ancho esta basada responsivamente al dispositivo
      height: MediaQuery.of(context).size.height / 4,
      width: MediaQuery.of(context).size.width / 3,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        //para borde circular
        borderRadius: BorderRadius.circular(10.0),
        color: color,
      ),
      child:
      Column(
        //para que centre lo que se pondra dentro del cuadrado
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Text(
            title,
            style: TextStyle(
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.width >=400?20.0:15.0
            ),
            textAlign: TextAlign.center,
          ),

          SizedBox(height: 10.0,),

          Text(
            number.toString(),
            style: TextStyle(
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.width >=400?20.0:15.0,
                fontWeight: FontWeight.bold
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

//Para primera pantalla
class _CountryList extends StatelessWidget{
  //para ser usado en el countrylist
  final List<Country> countries;
  final Database database;
  _CountryList({Key key,this.countries,this.database}): super(key:key);

  @override
  Widget build(BuildContext context) {
    //para la construccion de la lista
    return ListView.builder(
      //espaciado interno de 16 margenes derecha,izquierda,arriba y abajo
      padding: const EdgeInsets.all(16.0),
      //cantidad de items de la lista que pasamos
      itemCount: countries.length,
      //segun el index se construira un objeto nuevo
      //construira cada registro segun el metodo buildRow
      itemBuilder: (context, index) {
        return _buildRow(countries[index],context);
      },
    );
  }

  Widget _buildRow(Country country,BuildContext context){
    //De cada country que llega se almacena en una variable de bd
    final countryDB = CountryDB(
        country: country.country,
        cases: country.cases,
        todayCases: country.todayCases,
        deaths: country.deaths,
        todayDeaths: country.todayDeaths,
        recovered: country.recovered,
        active: country.active,
        critical: country.critical,
        casesPerOneMillion: country.casesPerOneMillion,
        deathsPerOneMillion: country.deathsPerOneMillion,
        totalTests: country.totalTests,
        testsPerOneMillion: country.testsPerOneMillion
    );
    return StreamBuilder(
        //si es que llegara algun pais agregado obtiene su nombre
      stream: database.getCountry(countryDB.country),
      builder: (context,AsyncSnapshot <CountryDB> snapchot){
        //recibe tanto algo como null
        final snapshotDB =snapchot.data ?? null;
        //cada objeto estara representado mediante una tarjeta
        return Card(
          //para que se note el efecto del card se vea mas gordito
          elevation: 2.0,
          //espaciado interno para el objeto
          child: Padding(
            padding: EdgeInsets.only(bottom: 15.0,top: 15.0),
            //ListTile:donde estara contenido los elementos de la lista que forman parte del objeto
            //osea lo que viene del json
            child: ListTile(
              //para llamar la imagen a la izquierda se usa leading
                leading: Image.asset('assets/world.png'),
                title: Text(
                    country.country
                ),
                subtitle:
                Text('Cases: '+country.cases.toString()+" | "+"Today: "+country.todayCases.toString()+" | "+"Active: "+country.active.toString()+
                    "\n"+"Deaths: "+country.deaths.toString()+" | "+"Today: "+country.todayDeaths.toString()+
                    "\n"+"Recovered: "+country.recovered.toString()+" | "+" Critical: "+country.critical.toString()),
                //esto es para agregar un boton al costado
                trailing:
                IconButton(
                  icon: Icon(snapshotDB== null?Icons.favorite_border:Icons.favorite),
                  onPressed: (){
                    database.addCountry(countryDB)
                        .then(
                            (value) =>
                            Scaffold.of(context).showSnackBar(
                                SnackBar(content: Text(country.country+' registrado como favorito'))
                            )
                    )
                        .catchError(
                            (e) =>
                            Scaffold.of(context).showSnackBar(
                                SnackBar(content: Text('Elemento ya se encuentra en la lista de favoritos'))
                            )
                    );
                  },
                )
            ),
          ),
        );
      }
    );
  }
}

//Para segunda pantalla
class _FavouriteList extends StatelessWidget{

  final List<CountryDB> favourites;
  final Database database;

  _FavouriteList({Key key,this.favourites,this.database}): super(key:key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: favourites.length,
      itemBuilder: (context, index) {
        return _buildRow(favourites[index],context);
      },
    );
  }

  Widget _buildRow(CountryDB country,BuildContext context){
    return Card(
      elevation: 2.0,
      child: Padding(
        padding: EdgeInsets.only(bottom: 15.0,top: 15.0),
        child: ListTile(
            leading: Image.asset('assets/world.png'),
            title: Text(
                country.country
            ),
            subtitle:
            Text('Cases: '+country.cases.toString()+" | "+"Today: "+country.todayCases.toString()+" | "+"Active: "+country.active.toString()+
                "\n"+"Deaths: "+country.deaths.toString()+" | "+"Today: "+country.todayDeaths.toString()+
                "\n"+"Recovered: "+country.recovered.toString()+" | "+" Critical: "+country.critical.toString()),
            trailing:
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: (){
                print("Borrando de la BD");
                database.deleteCountry(country)
                    .then(
                        (value) =>
                        Scaffold.of(context).showSnackBar(
                            SnackBar(content: Text('Se elimina '+country.country+' de favoritos'))
                        )
                )
                    .catchError(
                        (e) =>
                        Scaffold.of(context).showSnackBar(
                            SnackBar(content: Text('Error, nose pudo eliminar de la lista de favoritos'))
                        )
                );
              },
            )
        ),
      ),
    );
  }

}
import 'dart:async';
import 'package:moor_ffi/moor_ffi.dart';
import 'package:path_provider/path_provider.dart';
import 'package:moor/moor.dart';
import 'package:path/path.dart' as p;
import 'dart:io';
//IMPORTANTE ESTO
part 'MoorDatabase.g.dart';

@DataClassName("CountryDB")
class Countries extends Table{

  TextColumn get country => text()();
  IntColumn get cases => integer().nullable()();
  IntColumn get todayCases => integer().nullable()();
  IntColumn get deaths => integer().nullable()();
  IntColumn get todayDeaths => integer().nullable()();
  IntColumn get recovered => integer().nullable()();
  IntColumn get active => integer().nullable()();
  IntColumn get critical => integer().nullable()();
  IntColumn get casesPerOneMillion => integer().nullable()();
  IntColumn get deathsPerOneMillion => integer().nullable()();
  IntColumn get totalTests => integer().nullable()();
  IntColumn get testsPerOneMillion => integer().nullable()();

  @override
  Set<Column> get primaryKey => {country};
}

//Crear el archivo de base de datos de SQLITE
LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return VmDatabase(file);
  });
}

//use moor para hacer las operaciones de base de datos
@UseMoor(tables: [Countries])
class Database extends _$Database{

  Database() : super(_openConnection());

  @override
  int get schemaVersion => 1;
//IMPORTANTE: antes de seguir con lo demas se genera primero el codigo de base
  //de datos con flutter packages pub run build_runner watch

  //para que en tiempo real cargue la lista de la bd
  Stream<List<CountryDB>> get watchAllCountries => select(countries).watch();

  //Para que agregue un pais a la bd
  Future<int> addCountry(CountryDB country) {
    return into(countries).insert(country);
  }

  //Para eliminar un pais de la bd
  Future<int> deleteCountry(CountryDB country){
    return delete(countries).delete(country);
  }

  //obtener pais por nombre
  Future<List<CountryDB>> getCountriesByName(String name){
    return (select(countries)..where((tbl) => tbl.country.like('%'+name+'%'))).get();
  }

  //obtener un solo pais en especifico
  Stream<CountryDB> getCountry(String name){
    return  (select(countries)..where((tbl) => tbl.country.equals(name))).watchSingle();
  }

  //Despues se cambia la configuracion en android/settings.gradle,
//para el proyecto agarrar de este proyect nomas
}


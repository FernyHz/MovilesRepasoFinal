// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MoorDatabase.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class CountryDB extends DataClass implements Insertable<CountryDB> {
  final String country;
  final int cases;
  final int todayCases;
  final int deaths;
  final int todayDeaths;
  final int recovered;
  final int active;
  final int critical;
  final int casesPerOneMillion;
  final int deathsPerOneMillion;
  final int totalTests;
  final int testsPerOneMillion;
  CountryDB(
      {@required this.country,
      this.cases,
      this.todayCases,
      this.deaths,
      this.todayDeaths,
      this.recovered,
      this.active,
      this.critical,
      this.casesPerOneMillion,
      this.deathsPerOneMillion,
      this.totalTests,
      this.testsPerOneMillion});
  factory CountryDB.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final intType = db.typeSystem.forDartType<int>();
    return CountryDB(
      country:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}country']),
      cases: intType.mapFromDatabaseResponse(data['${effectivePrefix}cases']),
      todayCases: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}today_cases']),
      deaths: intType.mapFromDatabaseResponse(data['${effectivePrefix}deaths']),
      todayDeaths: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}today_deaths']),
      recovered:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}recovered']),
      active: intType.mapFromDatabaseResponse(data['${effectivePrefix}active']),
      critical:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}critical']),
      casesPerOneMillion: intType.mapFromDatabaseResponse(
          data['${effectivePrefix}cases_per_one_million']),
      deathsPerOneMillion: intType.mapFromDatabaseResponse(
          data['${effectivePrefix}deaths_per_one_million']),
      totalTests: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}total_tests']),
      testsPerOneMillion: intType.mapFromDatabaseResponse(
          data['${effectivePrefix}tests_per_one_million']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || country != null) {
      map['country'] = Variable<String>(country);
    }
    if (!nullToAbsent || cases != null) {
      map['cases'] = Variable<int>(cases);
    }
    if (!nullToAbsent || todayCases != null) {
      map['today_cases'] = Variable<int>(todayCases);
    }
    if (!nullToAbsent || deaths != null) {
      map['deaths'] = Variable<int>(deaths);
    }
    if (!nullToAbsent || todayDeaths != null) {
      map['today_deaths'] = Variable<int>(todayDeaths);
    }
    if (!nullToAbsent || recovered != null) {
      map['recovered'] = Variable<int>(recovered);
    }
    if (!nullToAbsent || active != null) {
      map['active'] = Variable<int>(active);
    }
    if (!nullToAbsent || critical != null) {
      map['critical'] = Variable<int>(critical);
    }
    if (!nullToAbsent || casesPerOneMillion != null) {
      map['cases_per_one_million'] = Variable<int>(casesPerOneMillion);
    }
    if (!nullToAbsent || deathsPerOneMillion != null) {
      map['deaths_per_one_million'] = Variable<int>(deathsPerOneMillion);
    }
    if (!nullToAbsent || totalTests != null) {
      map['total_tests'] = Variable<int>(totalTests);
    }
    if (!nullToAbsent || testsPerOneMillion != null) {
      map['tests_per_one_million'] = Variable<int>(testsPerOneMillion);
    }
    return map;
  }

  CountriesCompanion toCompanion(bool nullToAbsent) {
    return CountriesCompanion(
      country: country == null && nullToAbsent
          ? const Value.absent()
          : Value(country),
      cases:
          cases == null && nullToAbsent ? const Value.absent() : Value(cases),
      todayCases: todayCases == null && nullToAbsent
          ? const Value.absent()
          : Value(todayCases),
      deaths:
          deaths == null && nullToAbsent ? const Value.absent() : Value(deaths),
      todayDeaths: todayDeaths == null && nullToAbsent
          ? const Value.absent()
          : Value(todayDeaths),
      recovered: recovered == null && nullToAbsent
          ? const Value.absent()
          : Value(recovered),
      active:
          active == null && nullToAbsent ? const Value.absent() : Value(active),
      critical: critical == null && nullToAbsent
          ? const Value.absent()
          : Value(critical),
      casesPerOneMillion: casesPerOneMillion == null && nullToAbsent
          ? const Value.absent()
          : Value(casesPerOneMillion),
      deathsPerOneMillion: deathsPerOneMillion == null && nullToAbsent
          ? const Value.absent()
          : Value(deathsPerOneMillion),
      totalTests: totalTests == null && nullToAbsent
          ? const Value.absent()
          : Value(totalTests),
      testsPerOneMillion: testsPerOneMillion == null && nullToAbsent
          ? const Value.absent()
          : Value(testsPerOneMillion),
    );
  }

  factory CountryDB.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return CountryDB(
      country: serializer.fromJson<String>(json['country']),
      cases: serializer.fromJson<int>(json['cases']),
      todayCases: serializer.fromJson<int>(json['todayCases']),
      deaths: serializer.fromJson<int>(json['deaths']),
      todayDeaths: serializer.fromJson<int>(json['todayDeaths']),
      recovered: serializer.fromJson<int>(json['recovered']),
      active: serializer.fromJson<int>(json['active']),
      critical: serializer.fromJson<int>(json['critical']),
      casesPerOneMillion: serializer.fromJson<int>(json['casesPerOneMillion']),
      deathsPerOneMillion:
          serializer.fromJson<int>(json['deathsPerOneMillion']),
      totalTests: serializer.fromJson<int>(json['totalTests']),
      testsPerOneMillion: serializer.fromJson<int>(json['testsPerOneMillion']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'country': serializer.toJson<String>(country),
      'cases': serializer.toJson<int>(cases),
      'todayCases': serializer.toJson<int>(todayCases),
      'deaths': serializer.toJson<int>(deaths),
      'todayDeaths': serializer.toJson<int>(todayDeaths),
      'recovered': serializer.toJson<int>(recovered),
      'active': serializer.toJson<int>(active),
      'critical': serializer.toJson<int>(critical),
      'casesPerOneMillion': serializer.toJson<int>(casesPerOneMillion),
      'deathsPerOneMillion': serializer.toJson<int>(deathsPerOneMillion),
      'totalTests': serializer.toJson<int>(totalTests),
      'testsPerOneMillion': serializer.toJson<int>(testsPerOneMillion),
    };
  }

  CountryDB copyWith(
          {String country,
          int cases,
          int todayCases,
          int deaths,
          int todayDeaths,
          int recovered,
          int active,
          int critical,
          int casesPerOneMillion,
          int deathsPerOneMillion,
          int totalTests,
          int testsPerOneMillion}) =>
      CountryDB(
        country: country ?? this.country,
        cases: cases ?? this.cases,
        todayCases: todayCases ?? this.todayCases,
        deaths: deaths ?? this.deaths,
        todayDeaths: todayDeaths ?? this.todayDeaths,
        recovered: recovered ?? this.recovered,
        active: active ?? this.active,
        critical: critical ?? this.critical,
        casesPerOneMillion: casesPerOneMillion ?? this.casesPerOneMillion,
        deathsPerOneMillion: deathsPerOneMillion ?? this.deathsPerOneMillion,
        totalTests: totalTests ?? this.totalTests,
        testsPerOneMillion: testsPerOneMillion ?? this.testsPerOneMillion,
      );
  @override
  String toString() {
    return (StringBuffer('CountryDB(')
          ..write('country: $country, ')
          ..write('cases: $cases, ')
          ..write('todayCases: $todayCases, ')
          ..write('deaths: $deaths, ')
          ..write('todayDeaths: $todayDeaths, ')
          ..write('recovered: $recovered, ')
          ..write('active: $active, ')
          ..write('critical: $critical, ')
          ..write('casesPerOneMillion: $casesPerOneMillion, ')
          ..write('deathsPerOneMillion: $deathsPerOneMillion, ')
          ..write('totalTests: $totalTests, ')
          ..write('testsPerOneMillion: $testsPerOneMillion')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      country.hashCode,
      $mrjc(
          cases.hashCode,
          $mrjc(
              todayCases.hashCode,
              $mrjc(
                  deaths.hashCode,
                  $mrjc(
                      todayDeaths.hashCode,
                      $mrjc(
                          recovered.hashCode,
                          $mrjc(
                              active.hashCode,
                              $mrjc(
                                  critical.hashCode,
                                  $mrjc(
                                      casesPerOneMillion.hashCode,
                                      $mrjc(
                                          deathsPerOneMillion.hashCode,
                                          $mrjc(
                                              totalTests.hashCode,
                                              testsPerOneMillion
                                                  .hashCode))))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is CountryDB &&
          other.country == this.country &&
          other.cases == this.cases &&
          other.todayCases == this.todayCases &&
          other.deaths == this.deaths &&
          other.todayDeaths == this.todayDeaths &&
          other.recovered == this.recovered &&
          other.active == this.active &&
          other.critical == this.critical &&
          other.casesPerOneMillion == this.casesPerOneMillion &&
          other.deathsPerOneMillion == this.deathsPerOneMillion &&
          other.totalTests == this.totalTests &&
          other.testsPerOneMillion == this.testsPerOneMillion);
}

class CountriesCompanion extends UpdateCompanion<CountryDB> {
  final Value<String> country;
  final Value<int> cases;
  final Value<int> todayCases;
  final Value<int> deaths;
  final Value<int> todayDeaths;
  final Value<int> recovered;
  final Value<int> active;
  final Value<int> critical;
  final Value<int> casesPerOneMillion;
  final Value<int> deathsPerOneMillion;
  final Value<int> totalTests;
  final Value<int> testsPerOneMillion;
  const CountriesCompanion({
    this.country = const Value.absent(),
    this.cases = const Value.absent(),
    this.todayCases = const Value.absent(),
    this.deaths = const Value.absent(),
    this.todayDeaths = const Value.absent(),
    this.recovered = const Value.absent(),
    this.active = const Value.absent(),
    this.critical = const Value.absent(),
    this.casesPerOneMillion = const Value.absent(),
    this.deathsPerOneMillion = const Value.absent(),
    this.totalTests = const Value.absent(),
    this.testsPerOneMillion = const Value.absent(),
  });
  CountriesCompanion.insert({
    @required String country,
    this.cases = const Value.absent(),
    this.todayCases = const Value.absent(),
    this.deaths = const Value.absent(),
    this.todayDeaths = const Value.absent(),
    this.recovered = const Value.absent(),
    this.active = const Value.absent(),
    this.critical = const Value.absent(),
    this.casesPerOneMillion = const Value.absent(),
    this.deathsPerOneMillion = const Value.absent(),
    this.totalTests = const Value.absent(),
    this.testsPerOneMillion = const Value.absent(),
  }) : country = Value(country);
  static Insertable<CountryDB> custom({
    Expression<String> country,
    Expression<int> cases,
    Expression<int> todayCases,
    Expression<int> deaths,
    Expression<int> todayDeaths,
    Expression<int> recovered,
    Expression<int> active,
    Expression<int> critical,
    Expression<int> casesPerOneMillion,
    Expression<int> deathsPerOneMillion,
    Expression<int> totalTests,
    Expression<int> testsPerOneMillion,
  }) {
    return RawValuesInsertable({
      if (country != null) 'country': country,
      if (cases != null) 'cases': cases,
      if (todayCases != null) 'today_cases': todayCases,
      if (deaths != null) 'deaths': deaths,
      if (todayDeaths != null) 'today_deaths': todayDeaths,
      if (recovered != null) 'recovered': recovered,
      if (active != null) 'active': active,
      if (critical != null) 'critical': critical,
      if (casesPerOneMillion != null)
        'cases_per_one_million': casesPerOneMillion,
      if (deathsPerOneMillion != null)
        'deaths_per_one_million': deathsPerOneMillion,
      if (totalTests != null) 'total_tests': totalTests,
      if (testsPerOneMillion != null)
        'tests_per_one_million': testsPerOneMillion,
    });
  }

  CountriesCompanion copyWith(
      {Value<String> country,
      Value<int> cases,
      Value<int> todayCases,
      Value<int> deaths,
      Value<int> todayDeaths,
      Value<int> recovered,
      Value<int> active,
      Value<int> critical,
      Value<int> casesPerOneMillion,
      Value<int> deathsPerOneMillion,
      Value<int> totalTests,
      Value<int> testsPerOneMillion}) {
    return CountriesCompanion(
      country: country ?? this.country,
      cases: cases ?? this.cases,
      todayCases: todayCases ?? this.todayCases,
      deaths: deaths ?? this.deaths,
      todayDeaths: todayDeaths ?? this.todayDeaths,
      recovered: recovered ?? this.recovered,
      active: active ?? this.active,
      critical: critical ?? this.critical,
      casesPerOneMillion: casesPerOneMillion ?? this.casesPerOneMillion,
      deathsPerOneMillion: deathsPerOneMillion ?? this.deathsPerOneMillion,
      totalTests: totalTests ?? this.totalTests,
      testsPerOneMillion: testsPerOneMillion ?? this.testsPerOneMillion,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (country.present) {
      map['country'] = Variable<String>(country.value);
    }
    if (cases.present) {
      map['cases'] = Variable<int>(cases.value);
    }
    if (todayCases.present) {
      map['today_cases'] = Variable<int>(todayCases.value);
    }
    if (deaths.present) {
      map['deaths'] = Variable<int>(deaths.value);
    }
    if (todayDeaths.present) {
      map['today_deaths'] = Variable<int>(todayDeaths.value);
    }
    if (recovered.present) {
      map['recovered'] = Variable<int>(recovered.value);
    }
    if (active.present) {
      map['active'] = Variable<int>(active.value);
    }
    if (critical.present) {
      map['critical'] = Variable<int>(critical.value);
    }
    if (casesPerOneMillion.present) {
      map['cases_per_one_million'] = Variable<int>(casesPerOneMillion.value);
    }
    if (deathsPerOneMillion.present) {
      map['deaths_per_one_million'] = Variable<int>(deathsPerOneMillion.value);
    }
    if (totalTests.present) {
      map['total_tests'] = Variable<int>(totalTests.value);
    }
    if (testsPerOneMillion.present) {
      map['tests_per_one_million'] = Variable<int>(testsPerOneMillion.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CountriesCompanion(')
          ..write('country: $country, ')
          ..write('cases: $cases, ')
          ..write('todayCases: $todayCases, ')
          ..write('deaths: $deaths, ')
          ..write('todayDeaths: $todayDeaths, ')
          ..write('recovered: $recovered, ')
          ..write('active: $active, ')
          ..write('critical: $critical, ')
          ..write('casesPerOneMillion: $casesPerOneMillion, ')
          ..write('deathsPerOneMillion: $deathsPerOneMillion, ')
          ..write('totalTests: $totalTests, ')
          ..write('testsPerOneMillion: $testsPerOneMillion')
          ..write(')'))
        .toString();
  }
}

class $CountriesTable extends Countries
    with TableInfo<$CountriesTable, CountryDB> {
  final GeneratedDatabase _db;
  final String _alias;
  $CountriesTable(this._db, [this._alias]);
  final VerificationMeta _countryMeta = const VerificationMeta('country');
  GeneratedTextColumn _country;
  @override
  GeneratedTextColumn get country => _country ??= _constructCountry();
  GeneratedTextColumn _constructCountry() {
    return GeneratedTextColumn(
      'country',
      $tableName,
      false,
    );
  }

  final VerificationMeta _casesMeta = const VerificationMeta('cases');
  GeneratedIntColumn _cases;
  @override
  GeneratedIntColumn get cases => _cases ??= _constructCases();
  GeneratedIntColumn _constructCases() {
    return GeneratedIntColumn(
      'cases',
      $tableName,
      true,
    );
  }

  final VerificationMeta _todayCasesMeta = const VerificationMeta('todayCases');
  GeneratedIntColumn _todayCases;
  @override
  GeneratedIntColumn get todayCases => _todayCases ??= _constructTodayCases();
  GeneratedIntColumn _constructTodayCases() {
    return GeneratedIntColumn(
      'today_cases',
      $tableName,
      true,
    );
  }

  final VerificationMeta _deathsMeta = const VerificationMeta('deaths');
  GeneratedIntColumn _deaths;
  @override
  GeneratedIntColumn get deaths => _deaths ??= _constructDeaths();
  GeneratedIntColumn _constructDeaths() {
    return GeneratedIntColumn(
      'deaths',
      $tableName,
      true,
    );
  }

  final VerificationMeta _todayDeathsMeta =
      const VerificationMeta('todayDeaths');
  GeneratedIntColumn _todayDeaths;
  @override
  GeneratedIntColumn get todayDeaths =>
      _todayDeaths ??= _constructTodayDeaths();
  GeneratedIntColumn _constructTodayDeaths() {
    return GeneratedIntColumn(
      'today_deaths',
      $tableName,
      true,
    );
  }

  final VerificationMeta _recoveredMeta = const VerificationMeta('recovered');
  GeneratedIntColumn _recovered;
  @override
  GeneratedIntColumn get recovered => _recovered ??= _constructRecovered();
  GeneratedIntColumn _constructRecovered() {
    return GeneratedIntColumn(
      'recovered',
      $tableName,
      true,
    );
  }

  final VerificationMeta _activeMeta = const VerificationMeta('active');
  GeneratedIntColumn _active;
  @override
  GeneratedIntColumn get active => _active ??= _constructActive();
  GeneratedIntColumn _constructActive() {
    return GeneratedIntColumn(
      'active',
      $tableName,
      true,
    );
  }

  final VerificationMeta _criticalMeta = const VerificationMeta('critical');
  GeneratedIntColumn _critical;
  @override
  GeneratedIntColumn get critical => _critical ??= _constructCritical();
  GeneratedIntColumn _constructCritical() {
    return GeneratedIntColumn(
      'critical',
      $tableName,
      true,
    );
  }

  final VerificationMeta _casesPerOneMillionMeta =
      const VerificationMeta('casesPerOneMillion');
  GeneratedIntColumn _casesPerOneMillion;
  @override
  GeneratedIntColumn get casesPerOneMillion =>
      _casesPerOneMillion ??= _constructCasesPerOneMillion();
  GeneratedIntColumn _constructCasesPerOneMillion() {
    return GeneratedIntColumn(
      'cases_per_one_million',
      $tableName,
      true,
    );
  }

  final VerificationMeta _deathsPerOneMillionMeta =
      const VerificationMeta('deathsPerOneMillion');
  GeneratedIntColumn _deathsPerOneMillion;
  @override
  GeneratedIntColumn get deathsPerOneMillion =>
      _deathsPerOneMillion ??= _constructDeathsPerOneMillion();
  GeneratedIntColumn _constructDeathsPerOneMillion() {
    return GeneratedIntColumn(
      'deaths_per_one_million',
      $tableName,
      true,
    );
  }

  final VerificationMeta _totalTestsMeta = const VerificationMeta('totalTests');
  GeneratedIntColumn _totalTests;
  @override
  GeneratedIntColumn get totalTests => _totalTests ??= _constructTotalTests();
  GeneratedIntColumn _constructTotalTests() {
    return GeneratedIntColumn(
      'total_tests',
      $tableName,
      true,
    );
  }

  final VerificationMeta _testsPerOneMillionMeta =
      const VerificationMeta('testsPerOneMillion');
  GeneratedIntColumn _testsPerOneMillion;
  @override
  GeneratedIntColumn get testsPerOneMillion =>
      _testsPerOneMillion ??= _constructTestsPerOneMillion();
  GeneratedIntColumn _constructTestsPerOneMillion() {
    return GeneratedIntColumn(
      'tests_per_one_million',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        country,
        cases,
        todayCases,
        deaths,
        todayDeaths,
        recovered,
        active,
        critical,
        casesPerOneMillion,
        deathsPerOneMillion,
        totalTests,
        testsPerOneMillion
      ];
  @override
  $CountriesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'countries';
  @override
  final String actualTableName = 'countries';
  @override
  VerificationContext validateIntegrity(Insertable<CountryDB> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('country')) {
      context.handle(_countryMeta,
          country.isAcceptableOrUnknown(data['country'], _countryMeta));
    } else if (isInserting) {
      context.missing(_countryMeta);
    }
    if (data.containsKey('cases')) {
      context.handle(
          _casesMeta, cases.isAcceptableOrUnknown(data['cases'], _casesMeta));
    }
    if (data.containsKey('today_cases')) {
      context.handle(
          _todayCasesMeta,
          todayCases.isAcceptableOrUnknown(
              data['today_cases'], _todayCasesMeta));
    }
    if (data.containsKey('deaths')) {
      context.handle(_deathsMeta,
          deaths.isAcceptableOrUnknown(data['deaths'], _deathsMeta));
    }
    if (data.containsKey('today_deaths')) {
      context.handle(
          _todayDeathsMeta,
          todayDeaths.isAcceptableOrUnknown(
              data['today_deaths'], _todayDeathsMeta));
    }
    if (data.containsKey('recovered')) {
      context.handle(_recoveredMeta,
          recovered.isAcceptableOrUnknown(data['recovered'], _recoveredMeta));
    }
    if (data.containsKey('active')) {
      context.handle(_activeMeta,
          active.isAcceptableOrUnknown(data['active'], _activeMeta));
    }
    if (data.containsKey('critical')) {
      context.handle(_criticalMeta,
          critical.isAcceptableOrUnknown(data['critical'], _criticalMeta));
    }
    if (data.containsKey('cases_per_one_million')) {
      context.handle(
          _casesPerOneMillionMeta,
          casesPerOneMillion.isAcceptableOrUnknown(
              data['cases_per_one_million'], _casesPerOneMillionMeta));
    }
    if (data.containsKey('deaths_per_one_million')) {
      context.handle(
          _deathsPerOneMillionMeta,
          deathsPerOneMillion.isAcceptableOrUnknown(
              data['deaths_per_one_million'], _deathsPerOneMillionMeta));
    }
    if (data.containsKey('total_tests')) {
      context.handle(
          _totalTestsMeta,
          totalTests.isAcceptableOrUnknown(
              data['total_tests'], _totalTestsMeta));
    }
    if (data.containsKey('tests_per_one_million')) {
      context.handle(
          _testsPerOneMillionMeta,
          testsPerOneMillion.isAcceptableOrUnknown(
              data['tests_per_one_million'], _testsPerOneMillionMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {country};
  @override
  CountryDB map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return CountryDB.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $CountriesTable createAlias(String alias) {
    return $CountriesTable(_db, alias);
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $CountriesTable _countries;
  $CountriesTable get countries => _countries ??= $CountriesTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [countries];
}

import 'dart:convert';

import 'package:assignment/data/datasource/breweries_local_datasource.dart';
import 'package:assignment/datasources/local/session_manager.dart';
import 'package:assignment/domain/model/breweries_domain.dart';
import 'package:assignment/utils/constants.dart';

class BreweriesLocalDataSourceImpl extends BreweriesLocalDataSource {

  @override
  Future<List<BreweriesDomain>> getLocalStoredBreweries() async{
    var localStorage = SessionManager.getInstance();
    return await localStorage.getData(Constants.local_store_breweries_key) != null
        ? _map(json.decode(await localStorage.getData(Constants.local_store_breweries_key)) as List)
        : List<BreweriesDomain>();
  }

  @override
  Future<void> setBreweries(List<BreweriesDomain> breweriesDomain) async {
    try {
      var localStorage =  SessionManager.getInstance();
      return localStorage.saveData(Constants.local_store_breweries_key, json.encode(breweriesDomain));
    } catch (e) {
    }
  }

  List<BreweriesDomain> _map(List objects) {
    List<BreweriesDomain> elements =
    objects.map((element) => BreweriesDomain.fromJson(element)).toList();
    return elements;
  }

}